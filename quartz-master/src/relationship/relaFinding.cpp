#include "relafinding.h"
#include "quartz/circuitseq/circuitseq.h"
#include "quartz/utils/utils.h"
#include <cstdio>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_set>

bool DataExtracter::load_representatives(std::string file_name) {
  std::ifstream fin;
  fin.open(file_name, std::ifstream::in);
  if (!fin.is_open()) {
    std::cerr << "Representatives fails to open " << file_name << std::endl;
    return false;
  }
  int num;
  char tmp_char;
  CircuitSeqHashType hash_value;
  std::string dag;
  while (true) {
    fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
    fin >> std::hex >> hash_value;
    fin.ignore(std::numeric_limits<std::streamsize>::max(), ',');
    fin.ignore(std::numeric_limits<std::streamsize>::max(), ',');
    fin.ignore(std::numeric_limits<std::streamsize>::max(), ',');
    fin >> tmp_char;
    num = 0;
    dag.clear();
    while (true) {
      fin.get(tmp_char);
      if (tmp_char == '[')
        num--;
      else if (tmp_char == ']')
        num++;
      if (num > 0) {
        break;
      }
      dag.push_back(tmp_char);
    }
    representatives[hash_value] = dag;
    fin.get(tmp_char);
    fin.get(tmp_char);
    if (tmp_char != ',')
      break;
  }
  fin.close();
  for (auto &i : representatives) {
    dag_to_hash[i.second] = i.first;
  }
  return true;
}

void DataExtracter::print_loaded_representatives(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ifstream::out);
  for (auto &rep : representatives) {
    fout << "\"" << std::hex << rep.first << "\", [" << std::oct << rep.second
         << "]" << std::endl;
  }
  fout.close();
}

bool DataExtracter::load_relationships(std::string file_name) {
  std::ifstream fin;
  fin.open(file_name, std::ifstream::in);
  if (!fin.is_open()) {
    std::cerr << "load rela fails to open " << file_name << std::endl;
    return false;
  }
  std::stringstream ss;
  std::string line;
  char c;
  int father, child;
  std::unordered_set<int> children;
  while (getline(fin, line)) {
    ss.clear();
    children.clear();
    ss << line;
    ss >> father >> child;
    children.insert(child);
    while (ss >> c >> child) {
      children.insert(child);
    }
    relationships[father] = children;
  }
  fin.close();
  return true;
}

void DataExtracter::print_dag_to_hash(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ifstream::out);
  for (auto &rep : dag_to_hash) {
    fout << "\"" << rep.first << "\", [\"" << std::hex << rep.second << "\"]"
         << std::endl;
  }
  fout.close();
}

bool DataExtracter::load_dag_to_label(std::string file_name) {
  std::ifstream fin;
  std::stringstream ss;
  std::string line, dag;
  int label;
  fin.open(file_name, std::ifstream::in);
  if (!fin.is_open()) {
    std::cerr << "dag_to_label fails to open " << file_name << std::endl;
    return false;
  }
  while (getline(fin, line)) {
    ss.clear();
    ss << line;
    ss >> label >> dag;
    dag_to_label[dag] = label;
    label_to_dag[label] = dag;
  }
  fin.close();
  return true;
}

bool DataExtracter::load_eccs(std::string input_file, std::string output_file) {
  std::ifstream fin;
  fin.open(input_file, std::ifstream::in);
  if (!fin.is_open()) {
    std::cerr << "Eccs fails to open " << input_file << std::endl;
    return false;
  }
  fin.ignore(std::numeric_limits<std::streamsize>::max(), '{');
  char tmp_char;
  int num = 0, cnt = 0;
  std::string dag;
  fin.get(tmp_char); // tmp_char = '\n'
  CircuitSeqHashType tmp_rep;
  std::vector<std::string> tmp_dags;
  bool if_found_rep = false;
  tmp_char = ',';
  while (tmp_char == ',') {
    ECC tmp_ecc_set;
    tmp_rep = 0;
    tmp_dags.clear();
    if_found_rep = false;
    fin.ignore(std::numeric_limits<std::streamsize>::max(), '[');
    tmp_ecc_set.clear();
    tmp_char = ',';
    while (tmp_char == ',') {
      fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      fin.ignore(std::numeric_limits<std::streamsize>::max(), ',');
      fin.ignore(std::numeric_limits<std::streamsize>::max(), ',');
      fin.ignore(std::numeric_limits<std::streamsize>::max(), ',');
      num = 0;
      dag.clear();
      while (true) {
        fin.get(tmp_char);
        if (tmp_char == '[')
          num--;
        else if (tmp_char == ']')
          num++;
        if (num > 0) {
          break;
        }
        if (tmp_char != EOF) {
          dag.push_back(tmp_char);
        } else {
          std::cout << "get() false! " << std::endl;
          fin.close();
          return false;
        }
      }
      dag.erase(dag.begin(), dag.begin() + 1);
      dag.erase(dag.end() - 1, dag.end());
      fin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
      fin.get(tmp_char);
      tmp_ecc_set.push_dag(dag);
      if (dag_to_hash.find(dag) != dag_to_hash.end()) {
        tmp_rep = dag_to_hash[dag];
        if_found_rep = true;
      }
    }
    if (if_found_rep) {
      eccs[tmp_rep] = tmp_ecc_set;
    } else {
      std::cout << "tmp_rep doesn't found" << std::endl;
    }
    fin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    fin.get(tmp_char);
  }
  fin.close();
  std::ofstream fout;
  fout.open(output_file, std::ifstream::out);
  if (!fout.is_open()) {
    std::cerr << "Eccs fails to open " << output_file << std::endl;
    return false;
  }
  for (auto &ecc : eccs) {
    fout << "\"" << std::hex << ecc.first << std::oct << "\",{" << std::endl;
    for (auto &sec : ecc.second.get_dags()) {
      fout << "[" << sec.content() << "]," << std::endl;
    }
    fout << "}" << std::endl << std::endl;
  }
  fout.close();
  std::cout << std::oct << "num of eccs = " << eccs.size() << std::endl;
  for (auto &ecc : eccs) {
    cnt += ecc.second.get_dags().size();
    ecc.second.set_rep(DAG(representatives[ecc.first]));
  }
  std::cout << std::oct << "num of transformations = " << cnt << std::endl;
  return true;
}

bool DataExtracter::QCIR_gate(bool &is_single, std::string &quartz_name,
                              std::string &QCIR_name) {
  if (single_gates.find(quartz_name) != single_gates.end()) {
    QCIR_name = single_gates[quartz_name];
    is_single = true;
    return true;
  } else if (binary_gates.find(quartz_name) != binary_gates.end()) {
    QCIR_name = binary_gates[quartz_name];
    is_single = false;
    return true;
  } else {
    return false;
  }
}

bool DataExtracter::print_QCIR_patterns(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ofstream::out);
  if (!fout.is_open()) {
    std::cerr << "QCIR patterns' repository fails to open " << file_name
              << std::endl;
    return false;
  }
  std::stringstream ss;
  std::string dst;
  char c;
  int index;
  std::vector<bool> is_first(3);
  bool is_single = true;
  std::string qcir_name;
  is_first[0] = true;
  fout << "{" << std::endl;
  fout << "\t\"pattern\": {" << std::endl;
  for (auto &patt : patterns) {
    if (!is_first[0])
      fout << "," << std::endl;
    else
      is_first[0] = false;

    /* 根据rep的hash_value找到rep的的dag并生成dst*/
    dst.clear();
    DAG rep(patt.second.second);
    rep.extract_info();
    dst += "\t\t\t\t\"dst\": {\n\t\t\t\t\t\"cost\": ";
    dst += std::to_string(rep.gate_num);
    if (rep.gate_info.size() == 0)
      dst += ",\n\t\t\t\t\t\"circuit\": {}\n\t\t\t\t}";
    else {
      dst += ",\n\t\t\t\t\t\"circuit\": {\n";
      bool rep_first = true;
      for (auto &gate : rep.gate_info) {
        if (!rep_first)
          dst += ",\n";
        else
          rep_first = false;
        auto find_gate_type = QCIR_gate(is_single, gate.first, qcir_name);
        if (find_gate_type) {
          dst += "\t\t\t\t\t\t\"";
          dst += qcir_name;
          dst += "\": [";
          ss.clear();
          ss << gate.second[0];
          if (is_single) {
            ss >> c >> index;
            dst += std::to_string(index);
            dst += "]";
          } else {
            /* 此处因为quartz不支持数值作为操作数，只支持量子比特作为操作数，故不考虑操作数为P的情况
             */
            ss >> c >> index;
            dst += std::to_string(index);
            dst += ", ";
            ss.clear();
            ss << gate.second[1];
            ss >> c >> index;
            dst += std::to_string(index);
            dst += "]";
          }
        } else {
          std::cout << "transfer to qcir gate failed!" << std::endl;
          return false;
        }
      }
      dst += "\n\t\t\t\t\t}\n\t\t\t\t}";
    }
    fout << "\t\t\"p" << patt.first << "\": [" << std::endl;
    DAG dag(patt.second.first);
    dag.extract_info();
    fout << "\t\t\t{" << std::endl;
    fout << "\t\t\t\t\"qubits\": " << dag.qubit_num << "," << std::endl;
    fout << "\t\t\t\t\"src\": {" << std::endl;
    fout << "\t\t\t\t\t\"cost\": " << dag.gate_num << "," << std::endl;
    fout << "\t\t\t\t\t\"circuit\": {" << std::endl;
    is_first[2] = true;
    for (auto &gate : dag.gate_info) {
      if (!is_first[2])
        fout << "," << std::endl;
      else
        is_first[2] = false;
      auto find_gate_type = QCIR_gate(is_single, gate.first, qcir_name);
      if (find_gate_type) {
        fout << "\t\t\t\t\t\t\"" << qcir_name << "\": [";
        ss.clear();
        ss << gate.second[0];
        if (is_single) {
          ss >> c >> index;
          fout << index << "]";
        } else {
          /* 此处因为quartz不支持数值作为操作数，只支持量子比特作为操作数，故不考虑操作数为P的情况
           */
          ss >> c >> index;
          fout << index << ", ";
          ss.clear();
          ss << gate.second[1];
          ss >> c >> index;
          fout << index << "]";
        }
      } else {
        std::cout << "transfer to qcir gate failed!" << std::endl;
        return false;
      }
    }
    fout << std::endl << "\t\t\t\t\t}" << std::endl;
    fout << "\t\t\t\t}," << std::endl;
    fout << dst << std::endl;
    fout << "\t\t\t}" << std::endl;
    fout << "\t\t]";
  }
  fout << std::endl << "\t}" << std::endl;
  fout << "}" << std::endl;
  return true;
}

void DAG::print_info(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ofstream::app);
  if (!fout.is_open()) {
    std::cerr << "QCIR patterns' repository fails to open " << file_name
              << std::endl;
    return;
  }
  fout << dag << std::endl;
  fout << "gate_num = " << gate_num << std::endl;
  fout << "qubit_num = " << qubit_num << std::endl;
  fout << "para_num = " << para_num << std::endl;
  fout << "gate info :" << std::endl;
  for (auto &gate : gate_info) {
    fout << gate.first << ":";
    for (auto &op : gate.second) {
      fout << op << ",";
    }
    fout << std::endl;
  }
  fout << std::endl;
}

void DAG::extract_info() {
  std::string str = dag;
  if (str.size() == 0)
    return;
  int tmp_num;
  std::stringstream ss, ss2;
  ss.clear();
  ss << str;
  char tmp_char;
  tmp_char = ',';
  std::string gate_type, op1, op2;
  while (tmp_char == ',') {
    gate_type.clear();
    op1.clear();
    op2.clear();
    ss.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
    ss >> tmp_char;
    while (tmp_char != '\"') {
      gate_type.push_back(tmp_char);
      ss >> tmp_char;
    }
    // std::cout << "gate_type = " << gate_type << std::endl;
    gate_num++;
    if (gate_type == "cx") {
      ss.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      ss >> tmp_char;
      while (tmp_char != '\"') {
        op1.push_back(tmp_char);
        ss >> tmp_char;
      }
      ss >> tmp_char;
      // std::cout << "op1 = " << op1 << std::endl;
      ss.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      ss >> tmp_char;
      while (tmp_char != '\"') {
        op2.push_back(tmp_char);
        ss >> tmp_char;
      }
      ss >> tmp_char;
      // std::cout << "op2 = " << op2 << std::endl;
      gate_info.push_back({gate_type, {op1, op2}});
    } else {
      ss.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      ss >> tmp_char;
      while (tmp_char != '\"') {
        op1.push_back(tmp_char);
        ss >> tmp_char;
      }
      // std::cout << "op = " << op1 << std::endl;
      ss >> tmp_char;
      gate_info.push_back({gate_type, {op1}});
    }
    ss.ignore(std::numeric_limits<std::streamsize>::max(), ']');
    ss.ignore(std::numeric_limits<std::streamsize>::max(), ']');
    ss >> tmp_char;
  }
  for (auto &gate : gate_info) {
    for (auto &op : gate.second) {
      ss2.clear();
      ss2 << op;
      ss2 >> tmp_char >> tmp_num;
      if (tmp_char == 'Q' && tmp_num > this->qubit_num)
        this->qubit_num = tmp_num;
      else if (tmp_char == 'P' && tmp_num > this->para_num)
        this->para_num = tmp_num;
    }
  }
  this->qubit_num++;
  this->para_num++;
  valid = true;
}

std::string DAG::compact_info() {
  if (!valid)
    extract_info();
  std::string result = "";
  bool first = true;
  for (auto &gate : gate_info) {
    if (first) {
      first = false;
      result += "[";
    } else
      result += ",[";
    result += "\"";
    result += gate.first;
    result += "\",[\"";
    bool first_sec = true;
    for (auto &p : gate.second) {
      if (first_sec)
        first_sec = false;
      else
        result += ",\"";
      result += p;
      result += "\"";
    }
    result += "]]";
  }
  // std::cout << content()<< "       "<< result << std::endl;
  return result;
}

void DataExtracter::generate_QCIR_patterns() {
  std::string rep, mem;
  for (auto &ecc : eccs) {
    rep = representatives[ecc.first];
    for (auto &sec : ecc.second.get_dags()) {
      mem = sec.content();
      if (mem == rep)
        continue;
      DAG rep_dag(rep); // NOT compact info
      DAG mem_dag(mem); // NOT compact info
      int mem_label = dag_to_label[mem_dag.compact_info()];
      if (patterns.find(mem_label) != patterns.end()) {
        rep_dag.extract_info();
        DAG old_rep_dag(patterns[mem_label].second);
        old_rep_dag.extract_info();
        if (old_rep_dag.gate_num > rep_dag.gate_num)
          patterns[mem_label].second = rep;
      } else {
        patterns[mem_label].first = mem;
        patterns[mem_label].second = rep;
      }
    }
  }
  std::fstream fout;
  fout.open("pattern_out.json", std::ofstream::out);
  for (auto &i : patterns) {
    fout << i.first << " " << i.second.first << std::endl;
    fout << i.second.second << std::endl;
  }
  std::cout << "patterns = ";
  int cnt = 0;
  for (auto &i : patterns) {
    if (cnt % 10 == 0)
      std::cout << std::endl;
    std::cout << i.first;
    cnt++;
  }
  std::cout << std::endl;
}

void DataExtracter::print_front_label(std::string file_name) {
  std::fstream fout;
  fout.open(file_name, std::fstream::out);
  std::unordered_set<int> front_label, other_set;
  int cnt = 0;
  for (auto &p : patterns) {
    cnt++;
    if (cnt % 10 == 0)
      fout << std::endl;
    other_set.insert(p.first);
    fout << p.first << ",";
  }
  fout << std::endl;
  for (auto &i : relationships) {
      if (other_set.find(i.first) != other_set.end()){
        for(auto &j : i.second){
          if (other_set.find(j) != other_set.end())
            fout << i.first << "  " << j << std::endl;
        }
      }
    }
    fout << std::endl;
  fout.close();
}

int main() {
  DataExtracter dataExtracter;
  dataExtracter.load_representatives("representatives.json");
  dataExtracter.load_relationships("relationships.json");
  dataExtracter.print_dag_to_hash("dag_to_hash.json");
  dataExtracter.load_dag_to_label("label_to_dag.json");
  dataExtracter.load_eccs("eccs.json", "loaded_eccs.json");
  /*for (auto &eccs : dataExtracter.eccs) {
    for (auto &ecc : eccs.second.get_dags()) {
      ecc.extract_info();
      // it's ofstream::app
      // ecc.print_info("gate_info.json");
      std::cout << ecc.compact_info() << std::endl;
    }
  }*/
  dataExtracter.generate_QCIR_patterns();
  dataExtracter.print_front_label("front_label.json");
  dataExtracter.print_QCIR_patterns("quartz_pattern.json");
}