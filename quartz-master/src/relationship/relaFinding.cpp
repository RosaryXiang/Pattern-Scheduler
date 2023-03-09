#include "relafinding.h"
#include "quartz/circuitseq/circuitseq.h"
#include "quartz/utils/utils.h"
#include <cstdio>
#include <fstream>
#include <sstream>

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

void DataExtracter::print_dag_to_hash(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ifstream::out);
  for (auto &rep : dag_to_hash) {
    fout << "\"" << rep.first << "\", [\"" << std::hex << rep.second << "\"]"
         << std::endl;
  }
  fout.close();
}
void DataExtracter::add_relationship(
    CircuitSeqHashType repFather,
    std::vector<CircuitSeqHashType> &repChildren) {
  for (const auto &offset : {0, -1, 1}) {
    auto it = representatives.find(repFather + offset);
    if (it != representatives.end()) {
      std::vector<CircuitSeqHashType> realChildren;
      for (auto &child : repChildren) {
        for (const auto &offsetChild : {0, -1, 1}) {
          auto ifrep = representatives.find(child + offsetChild);
          if (ifrep != representatives.end()) {
            realChildren.push_back(child);
          }
        }
      }
      relationships[repFather + offset] = realChildren;
    }
  }
}

bool DataExtracter::load_relationships(std::string file_name) {
  std::ifstream fin;
  fin.open(file_name, std::ifstream::in);
  if (!fin.is_open()) {
    std::cerr << "Relationships fails to open " << file_name << std::endl;
    return false;
  }
  CircuitSeqHashType fatherHash, tmpChildHash;
  std::vector<CircuitSeqHashType> childrenHash;
  char tmp_char;
  while (tmp_char != ']') {
    childrenHash.clear();
    fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
    fin >> std::hex >> fatherHash;
    fin >> tmp_char;
    while (tmp_char != ']') {
      fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      fin >> std::hex >> tmpChildHash;
      childrenHash.push_back(tmpChildHash);
      fin.get(tmp_char);
      fin.get(tmp_char);
    }
    add_relationship(fatherHash, childrenHash);
    fin.get(tmp_char);
    fin.get(tmp_char);
    // std::cout << tmp_char << std::endl;
  }
  fin.close();
  return true;
}

void DataExtracter::print_loaded_relationships(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ifstream::out);
  for (auto &rela : relationships) {
    fout << "[[\"" << std::hex << rela.first << "\"], [";
    for (auto &succ : rela.second) {
      fout << "[\"" << succ << "\"],";
    }
    fout << "]" << std::endl;
  }
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
  int num = 0, cnt = 0, label = 0, qubit_num = 0;
  std::string dag;
  fin.get(tmp_char);
  CircuitSeqHashType tmp_rep;
  std::vector<std::string> tmp_dags;
  bool if_found_rep = false;
  tmp_char = ',';
  while (tmp_char == ',') {
    ECCSet tmp_ecc_set;
    fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
    fin >> label;
    fin.get(tmp_char);
    fin >> qubit_num;
    // tmp_ecc.set_qubit_num(qubit_num);
    fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
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
  std::cout << "num of eccs = " << eccs.size() << std::endl;
  for (auto &ecc : eccs) {
    cnt += ecc.second.get_dags().size();
  }
  std::cout << "num of transformations = " << cnt << std::endl;
  return true;
}

bool DataExtracter::print_QCIR_patterns(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ofstream::out);
  if (!fout.is_open()) {
    std::cerr << "QCIR patterns' repository fails to open " << file_name
              << std::endl;
    return false;
  }
  fout << "{" << std::endl;
  fout << "\t\"pattern\": {" << std::endl;
  fout << "\t\t\"quartz\": [" << std::endl;
  fout << "\t\t\t{" << std::endl;

  return true;
}

void ECC::print_info() {
  std::cout << "gate_num = " << gate_num << std::endl;
  std::cout << "qubit_num = " << qubit_num << std::endl;
  std::cout << "para_num = " << para_num << std::endl;
  std::cout << "gate info :" << std::endl;
  for (auto &gate : gate_info) {
    std::cout << gate.first << ":";
    for (auto &op : gate.second) {
      std::cout << op << ",";
    }
    std::cout << std::endl;
  }
}

void ECC::extract_info() {
  std::string str = dag;
  std::unordered_set<std::string> qubits_set, paras_set;
  std::stringstream ss;
  ss.clear();
  ss << str;
  char tmp_char, op_type;
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
      op_type = tmp_char;
      while (tmp_char != '\"') {
        op1.push_back(tmp_char);
        ss >> tmp_char;
      }
      ss >> tmp_char;
      // std::cout << "op1 = " << op1 << std::endl;
      if (op_type == 'Q') {
        if (qubits_set.find(op1) == qubits_set.end())
          qubits_set.insert(op1);
      } else {
        if (paras_set.find(op1) == paras_set.end())
          paras_set.insert(op1);
      }
      ss.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      ss >> tmp_char;
      op_type = tmp_char;
      while (tmp_char != '\"') {
        op2.push_back(tmp_char);
        ss >> tmp_char;
      }
      ss >> tmp_char;
      // std::cout << "op2 = " << op2 << std::endl;
      if (op_type == 'Q') {
        if (qubits_set.find(op1) == qubits_set.end())
          qubits_set.insert(op1);
      } else {
        if (paras_set.find(op1) == paras_set.end())
          paras_set.insert(op1);
      }
      gate_info.push_back({gate_type, {op1, op2}});
    } else {
      ss.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
      ss >> tmp_char;
      op_type = tmp_char;
      while (tmp_char != '\"') {
        op1.push_back(tmp_char);
        ss >> tmp_char;
      }
      // std::cout << "op = " << op1 << std::endl;
      ss >> tmp_char;
      if (op_type == 'Q') {
        if (qubits_set.find(op1) == qubits_set.end())
          qubits_set.insert(op1);
      } else {
        if (paras_set.find(op1) == paras_set.end())
          paras_set.insert(op1);
      }
      gate_info.push_back({gate_type, {op1}});
    }
    ss.ignore(std::numeric_limits<std::streamsize>::max(), ']');
    ss.ignore(std::numeric_limits<std::streamsize>::max(), ']');
    ss >> tmp_char;
  }
  qubit_num = qubits_set.size();
  para_num = paras_set.size();
  // print_info();
}

int main() {
  DataExtracter dataExtracter;
  dataExtracter.load_representatives("representatives.json");
  //   dataExtracter.print_loaded_representatives("rep_out.json");
  dataExtracter.print_dag_to_hash("dag_to_hash.json");
  dataExtracter.load_relationships("relationships.json");
  dataExtracter.print_loaded_relationships("rela_out.json");
  dataExtracter.load_eccs("eccs.json", "loaded_eccs.json");
  dataExtracter.print_QCIR_patterns("pattern.json");
  // ECC tmp_ecc("[\"cx\", [\"Q1\", \"Q0\"],[\"Q1\", \"Q0\"]],[\"tdg\", "
  //             "[\"Q0\"],[\"Q0\"]],[\"cx\", [\"Q1\", \"Q0\"],[\"Q1\",
  //             \"Q0\"]]");
  // tmp_ecc.extract_info();
  int cnt = 0;
  for (auto &eccs : dataExtracter.eccs) {
    cnt++;
    std::cout << "cnt = " << cnt << std::endl;
    for (auto &ecc : eccs.second.get_dags()) {
      std::cout << ecc.content() << std::endl;
      ecc.extract_info();
    }
  }
}