#include "relafinding.h"
#include "quartz/circuitseq/circuitseq.h"
#include "quartz/utils/utils.h"
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>

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

void DataExtracter::print_front_rep(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ifstream::out);
  std::unordered_set<CircuitSeqHashType> hash_set;
  for (auto &rep : representatives) {
    hash_set.insert(rep.first);
  }
  /* 如果某个rep是由其他rep生成的，将它从hash_set中去掉*/
  for (auto &rela : relationships) {
    for (auto &sec : rela.second) {
      hash_set.erase(sec);
    }
  }
  fout << std::hex;
  for (auto &hash : hash_set) {
    /* 只输出在ecc中有优化价值的rep*/
    if (eccs.find(hash) != eccs.end() || eccs.find(hash - 1) != eccs.end() ||
        eccs.find(hash + 1) != eccs.end())
      fout << hash << std::endl;
  }
  fout.close();
  /* 输出结果为空 说明ecc中的rep均不是由其他rep生成的, 以下为验证*/
  // for (auto &ecc : eccs) {
  //   for (auto &rela : relationships) {
  //     for (auto &sec : rela.second) {
  //       if (sec == ecc.first)
  //         std::cout << "wrong! " << std::endl;
  //     }
  //   }
  // }
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
  // only when child and father are representatives can their rela be reserved
  for (const auto &offset : {0, -1, 1}) {
    auto it = representatives.find(repFather + offset);
    if (it != representatives.end()) {
      std::unordered_set<CircuitSeqHashType> realChildren;
      for (auto &child : repChildren) {
        for (const auto &offsetChild : {0, -1, 1}) {
          auto ifrep = representatives.find(child + offsetChild);
          if (ifrep != representatives.end()) {
            realChildren.insert(child + offsetChild);
          }
        }
      }
      relationships[repFather + offset] = realChildren;
      break;
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

void DataExtracter::clean_wrongly_linked_rela() {
  std::unordered_set<unsigned long long> erase_set;
  for (auto &rela : relationships) {
    if (representatives.find(rela.first) == representatives.end()) {
      std::cout << "rep error!" << std::endl;
      continue;
    }
    auto father = DAG(representatives[rela.first]);
    father.extract_info();
    erase_set.clear();
    for (auto &sec : rela.second) {
      if (representatives.find(sec) == representatives.end()) {
        std::cout << "rep error!" << std::endl;
        continue;
      }
      auto child = DAG(representatives[sec]);
      child.extract_info();
      if (father.gate_num != child.gate_num - 1) {
        erase_set.insert(sec);
        continue;
      }
      for (int i = 0; i < child.gate_info.size() - 1; i++) {
        if (child.gate_info[i] != father.gate_info[i]) {
          // std::cout << "father = " << std::hex << rela.first << std::endl;
          // std::cout << "child = " << sec << std::oct << std::endl;
          erase_set.insert(sec);
        }
      }
    }
    for (auto &i : erase_set) {
      rela.second.erase(i);
    }
  }
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
  int num = 0, cnt = 0;
  std::string dag;
  fin.get(tmp_char);
  CircuitSeqHashType tmp_rep;
  std::vector<std::string> tmp_dags;
  bool if_found_rep = false;
  tmp_char = ',';
  while (tmp_char == ',') {
    ECC tmp_ecc_set;
    fin.ignore(std::numeric_limits<std::streamsize>::max(), '\"');
    fin.get(tmp_char);
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
  for (auto &ecc : eccs) {
    if (!is_first[0])
      fout << "," << std::endl;
    else
      is_first[0] = false;

    /* 根据rep的hash_value找到rep的的dag并生成dst*/
    dst.clear();
    if (representatives.find(ecc.first) == representatives.end()) {
      std::cout << "representative not found !" << std::endl;
      return false;
    }
    DAG rep(representatives[ecc.first]);
    rep.extract_info();
    dst += "\t\t\t\t\"dst\": {\n\t\t\t\t\t\"cost\": ";
    dst += std::to_string(rep.gate_num);
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
    fout << "\t\t\"hash" << std::hex << ecc.first << std::oct << "\": ["
         << std::endl;
    is_first[1] = true;
    for (auto &dag : ecc.second.get_dags()) {
      if (!is_first[1])
        fout << "," << std::endl;
      else
        is_first[1] = false;
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
      fout << "\t\t\t}";
    }
    fout << std::endl << "\t\t]";
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
  std::unordered_set<std::string> qubits_set, paras_set;
  qubits_set.clear();
  paras_set.clear();
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
        qubits_set.insert(op1);
      } else {
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
        qubits_set.insert(op2);
      } else {
        paras_set.insert(op2);
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
        qubits_set.insert(op1);
      } else {
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
}

void DataExtracter::print_rela_in_eccs(std::string file_name) {
  std::ofstream fout;
  fout.open(file_name, std::ofstream::out);
  std::unordered_set<CircuitSeqHashType> eccs_hash_set;
  for (auto &ecc : eccs) {
    eccs_hash_set.insert(ecc.first);
  }
  fout << std::hex;
  for (auto &rela : relationships) {
    if (eccs_hash_set.find(rela.first) == eccs_hash_set.end())
      continue;
    fout << "[[\"" << rela.first << "\",[";
    for (auto &sec : rela.second) {
      if (eccs_hash_set.find(sec) != eccs_hash_set.end())
        fout << "\"" << sec << "\",";
      else if (eccs_hash_set.find(sec + 1) != eccs_hash_set.end())
        fout << "\"" << sec + 1 << "\",";
      else if (eccs_hash_set.find(sec - 1) != eccs_hash_set.end())
        fout << "\"" << sec - 1 << "\",";
    }
    fout << "]]," << std::endl;
  }
}

int main() {
  DataExtracter dataExtracter;
  dataExtracter.load_representatives("representatives.json");
  // dataExtracter.print_loaded_representatives("rep_out.json");
  dataExtracter.print_dag_to_hash("dag_to_hash.json");
  dataExtracter.load_relationships("relationships.json");
  dataExtracter.print_loaded_relationships("rela_out.json");
  dataExtracter.clean_wrongly_linked_rela();
  dataExtracter.print_loaded_relationships("rela_after_clean.json");
  dataExtracter.print_front_rep("front_rep.json");
  dataExtracter.load_eccs("eccs.json", "loaded_eccs.json");
  // DAG tmp_ecc("[\"cx\", [\"Q1\", \"Q0\"],[\"Q1\", \"Q0\"]],[\"tdg\", "
  //             "[\"Q0\"],[\"Q0\"]],[\"cx\", [\"Q1\", \"Q0\"],[\"Q1\",
  //             \"Q0\"]]");
  // tmp_ecc.extract_info();
  dataExtracter.print_QCIR_patterns("pattern_in_quartz.json");
  dataExtracter.print_rela_in_eccs("rela_in_eccs.json");
  // for (auto &eccs : dataExtracter.eccs) {
  //   for (auto &ecc : eccs.second.get_dags()) {
  //     ecc.extract_info();
  //    //it's ofstream::app
  //     ecc.print_info("gate_info.json");
  //   }
  // }
}