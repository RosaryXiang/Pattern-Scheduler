#include "relafinding.h"
#include "quartz/circuitseq/circuitseq.h"
#include "quartz/utils/utils.h"
#include <algorithm>
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
    fout << "\"" << std::hex << rep.first << "\", [" << std::dec << rep.second
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
  std::ofstream fout;
  fout.open("loaded_dag_to_label.json", std::ofstream::out);
  std::stringstream ss;
  std::string line, dag, str;
  int label;
  fin.open(file_name, std::ifstream::in);
  if (!fin.is_open()) {
    std::cerr << "dag_to_label fails to open " << file_name << std::endl;
    return false;
  }
  char c;
  while (getline(fin, line)) {
    ss.clear();
    ss << line;
    ss >> label;
    dag.clear();
    while (ss >> str) {
      dag += str;
      dag += " ";
    }
    dag.erase(dag.size() - 1);
    dag_to_label[dag] = label;
    label_to_dag[label] = dag;
    fout << label << " " << dag << std::endl;
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
    fout << "\"" << std::hex << ecc.first << std::dec << "\",{" << std::endl;
    for (auto &sec : ecc.second.get_dags()) {
      fout << "[" << sec.content() << "]," << std::endl;
    }
    fout << "}" << std::endl << std::endl;
  }
  fout.close();
  std::cout << std::dec << "num of eccs = " << eccs.size() << std::endl;
  for (auto &ecc : eccs) {
    cnt += ecc.second.get_dags().size();
    ecc.second.set_rep(DAG(representatives[ecc.first]));
  }
  std::cout << std::dec << "num of transformations = " << cnt << std::endl;
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
    DAG rep(label_to_dag[patt.second]);
    rep.extract_info();
    dst += "\t\t\t\t\"dst\": {\n\t\t\t\t\t\"cost\": ";
    dst += std::to_string(rep.cost);
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
    DAG dag(label_to_dag[patt.first]);
    dag.extract_info();
    fout << "\t\t\t{" << std::endl;
    fout << "\t\t\t\t\"qubits\": " << dag.qubit_num << "," << std::endl;
    fout << "\t\t\t\t\"src\": {" << std::endl;
    fout << "\t\t\t\t\t\"cost\": " << dag.cost << "," << std::endl;
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

bool DataExtracter::print_QCIR_patterns_with_cost_limit(std::string file_name) {
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
  for (int i = max_gate_num; i > 0; i--) {
    for (auto &patt : patterns_clustered_by_gate_num[i]) {
      if (!is_first[0])
        fout << "," << std::endl;
      else
        is_first[0] = false;

      /* 根据rep的hash_value找到rep的的dag并生成dst*/
      dst.clear();
      DAG rep(label_to_dag[patterns_with_cost_limit[patt]]);
      rep.extract_info();
      dst += "\t\t\t\t\"dst\": {\n\t\t\t\t\t\"cost\": ";
      dst += std::to_string(rep.cost);
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
      fout << "\t\t\"p" << patt << "\": [" << std::endl;
      DAG dag(label_to_dag[patt]);
      dag.extract_info();
      fout << "\t\t\t{" << std::endl;
      fout << "\t\t\t\t\"qubits\": " << dag.qubit_num << "," << std::endl;
      fout << "\t\t\t\t\"src\": {" << std::endl;
      fout << "\t\t\t\t\t\"cost\": " << dag.cost << "," << std::endl;
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
      cost += 2;
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
      cost += 1;
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

void DataExtracter::generate_patterns() {
  std::string rep, mem;
  std::cout << "eccs.size() = " << eccs.size() << std::endl;
  for (auto &ecc : eccs) {
    rep = representatives[ecc.first];
    for (auto &sec : ecc.second.get_dags()) {
      mem = sec.content();
      if (mem == rep)
        continue;
      DAG rep_dag(rep);
      DAG mem_dag(mem);
      int mem_label = dag_to_label[mem];
      int rep_label = dag_to_label[rep];
      if (patterns.find(mem_label) != patterns.end()) {
        rep_dag.extract_info();
        DAG old_rep_dag(label_to_dag[patterns[mem_label]]);
        old_rep_dag.extract_info();
        if (old_rep_dag.cost > rep_dag.cost)
          patterns[mem_label] = rep_label;
      } else {
        patterns[mem_label] = rep_label;
      }
    }
  }
  for (auto &p : patterns) {
    DAG rep = DAG(label_to_dag[p.second]);
    rep.extract_info();
    DAG dag = DAG(label_to_dag[p.first]);
    dag.extract_info();
    if (rep.cost < dag.cost && rep.gate_num < dag.gate_num) {
      patterns_with_cost_limit.insert(p);
    }
  }
}

void DataExtracter::classify_patterns_by_gate_num() {
  int tmp_max_gate_num = 0;
  for (auto &i : patterns_with_cost_limit) {
    DAG non_rep(label_to_dag[i.first]);
    non_rep.extract_info();
    if (non_rep.gate_num > tmp_max_gate_num)
      tmp_max_gate_num = non_rep.gate_num;
  }
  std::cout << "max gate num  =" << tmp_max_gate_num << std::endl;
  std::unordered_set<int> tmp_set;
  for (int i = tmp_max_gate_num; i > 0; i--) {
    tmp_set.clear();
    for (auto &p : patterns_with_cost_limit) {
      DAG non_rep(label_to_dag[p.first]);
      non_rep.extract_info();
      if (non_rep.gate_num == i)
        tmp_set.insert(p.first);
    }
    patterns_clustered_by_gate_num[i] = tmp_set;
  }
  max_gate_num = tmp_max_gate_num;
}

void DataExtracter::print_general_front_label(std::string file_name){
  std::unordered_set<int> generated_patterns;
  for(auto &i : pattern_relationships_with_cost_limit){
    for(auto &j :i.second){
      generated_patterns.insert(j);
    }
  }
  std::unordered_set<int> general_front_labels;
  for(auto &i :pattern_relationships_with_cost_limit){
    if(generated_patterns.find(i.first)== generated_patterns.end())
      general_front_labels.insert(i.first);
  }
  std::fstream fout;
  fout.open(file_name, std::fstream::out);
  // print them out
  for (auto &i : general_front_labels) {
    fout << i << std::endl;
  }
  fout.close();
}

void DataExtracter::print_front_label_for_inclusion_patterns(std::string file_name, int succeeding_pattern_num_threshold) {
  std::fstream fout;
  fout.open(file_name, std::fstream::out);
  std::unordered_set<int> pattern_set;
  for (auto &r : pattern_relationships_with_cost_limit) {
    if (r.second.size() < succeeding_pattern_num_threshold)
      continue;
    pattern_set.insert(r.first);
  }
  // erase all patterns generated from other patterns
  for (auto &i : pattern_relationships_with_cost_limit) {
    for (auto &j : i.second) {
      pattern_set.erase(j);
    }
  }
  front_labels_for_inclusion_patterns = pattern_set;
  // print them out
  for (auto &i : pattern_set) {
    fout << i << std::endl;
  }
  fout.close();
}

//"is_pattern == true" means upper_ dag is a pattern
void DataExtracter::link(bool &&is_pattern, const int &upper_dag,
                         const std::unordered_set<int> &lower_dags) {
  std::fstream fout;
  // fout.open("debug_link.txt", std::ofstream::app);
  // fout << is_pattern << " " << upper_dag << " ";
  // for (auto &i : lower_dags) {
  //   fout << i << ",";
  // }
  // fout << std::endl;
  std::unordered_set<int> empty_set;
  empty_set.clear();
  if (is_pattern) {
    for (auto &i : lower_dags) {
      if (patterns_with_cost_limit.find(i) != patterns_with_cost_limit.end()) {
        pattern_relationships_with_cost_limit[upper_dag].insert(i);
        if (relationships.find(i) != relationships.end())
          link(true, i, relationships[i]);
      } else {
        if (relationships.find(i) != relationships.end())
          link(true, upper_dag, relationships[i]);
      }
    }
  } else {
    if (patterns_with_cost_limit.find(upper_dag) !=
        patterns_with_cost_limit.end()) {
      if (relationships.find(upper_dag) != relationships.end()) {
        pattern_relationships_with_cost_limit[upper_dag] = empty_set;
        link(true, upper_dag, relationships[upper_dag]);
      } else {
        pattern_relationships_with_cost_limit[upper_dag] = empty_set;
      }
    } else {
      for (auto &i : relationships[upper_dag]) {
        link(false, i, relationships[upper_dag]);
      }
    }
  }
}

void DataExtracter::generate_relationships_between_patterns(
    std::string file_name) {
  std::fstream fout;
  fout.open(file_name, std::ofstream::out);

  link(false, 0, relationships[0]);

  for (auto &i : pattern_relationships_with_cost_limit) {
    if (i.second.size() == 0)
      continue;
    bool first = true;
    fout << i.first << " ";
    for (auto &j : i.second) {
      if (first)
        first = false;
      else
        fout << ",";
      fout << j;
    }
    fout << std::endl;
  }
  fout.close();
}

void DataExtracter::generate_testfiles_of_inclusion_patterns(std::string file_name){
  std::string title = "OPENQASM 2.0;\ninclude \"qelib1.inc\";\n";
  std::stringstream ss;
  char tmp_char;
  int qref;
  std::vector<int> tmp_vec;
  for(auto &front_label : front_labels_for_inclusion_patterns){
    tmp_vec.clear();
    for(auto &i : pattern_relationships_with_cost_limit[front_label]){
      tmp_vec.push_back(i);
    }
    int target_pattern_label = tmp_vec[tmp_vec.size()-1];
    std::cout << target_pattern_label << std::endl;
    std::fstream fout;
    fout.open(file_name+"/"+std::to_string(target_pattern_label)+".qasm", std::ofstream::out);
    fout<< title;
    DAG dag(label_to_dag[target_pattern_label]);
    dag.extract_info();
    fout << "qreg q[" << dag.qubit_num << "];" << std::endl;
    fout << "creg c[" << dag.qubit_num << "];" << std::endl;
    for(auto &g : dag.gate_info){
      fout << g.first << " ";
      bool first = true;
      for(auto &p : g.second){
        if(first)
          first = false;
        else
          fout << ",";
        ss.clear();
        ss << p;
        ss >> tmp_char >> qref;
        if(tmp_char == 'Q')
          fout << "q[" << qref << "]";
        else
          std::cout << "warning ! para type wrong!" << std::endl;
      }
      fout << ";" << std::endl;
    }
    fout.close();
  }
}

int main() {
  std::string data_file_name = "304";
  std::string relationship_loc = "/home/jun/桌面/lab/patt schd/quartz-master/src/relationship/";
  DataExtracter dataExtracter;
  dataExtracter.load_representatives("/home/jun/桌面/lab/patt schd/quartz-master/3_2_3_representative_set.json");
  dataExtracter.load_relationships(
      "/home/jun/桌面/lab/patt schd/quartz-master/succeed_info_map.json");
  // dataExtracter.generate_reverse_rela();
  // dataExtracter.print_dag_to_hash("dag_to_hash.json");
  dataExtracter.load_dag_to_label(
      "/home/jun/桌面/lab/patt schd/quartz-master/label_to_dag.json");
  dataExtracter.load_eccs(
      "/home/jun/桌面/lab/patt schd/quartz-master/3_2_3_complete_ECC_set.json",
      "loaded_eccs.json");
  dataExtracter.generate_patterns();
  dataExtracter.classify_patterns_by_gate_num();
  // dataExtracter.print_QCIR_patterns("quartz_pattern.json");
  dataExtracter.print_QCIR_patterns_with_cost_limit(
      relationship_loc +data_file_name + "/patterns_with_cost_limit.json");
  dataExtracter.generate_relationships_between_patterns(relationship_loc +data_file_name + "/pattern_relationships_with_cost_limit.json");
  dataExtracter.print_front_label_for_inclusion_patterns(relationship_loc +data_file_name + "/front_label.json", 3);
  dataExtracter.print_general_front_label(relationship_loc +data_file_name + "/general_front_labels.json");
  dataExtracter.generate_testfiles_of_inclusion_patterns(relationship_loc+ data_file_name + "/testfiles");
}