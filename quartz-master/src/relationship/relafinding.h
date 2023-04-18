#include "quartz/circuitseq/circuitseq.h"
#include <unordered_map>
#include <unordered_set>
#include <vector>
using CircuitSeqHashType = unsigned long long;

class DAG {
public:
  DAG(): dag(""){}
  DAG(std::string content): dag(content){}
  std::string content() { return dag; }
  void print_info(std::string);
  void extract_info();
  void extract_info_from_compact_info();
  std::string compact_info();

public:
  bool valid = false; 
  std::string dag;
  // first string = gate type
  // vector<string> = vector of op
  std::vector<std::pair<std::string, std::vector<std::string>>> gate_info;
  int gate_num = 0;
  int qubit_num = 0;
  int para_num = 0;
};

class ECC {
public:
  void push_dag(std::string dag) { dags.push_back(DAG(dag)); }
  void clear() { dags.clear(); }
  void set_rep(DAG rep) { rep_ = rep; }
  std::vector<DAG> get_dags() { return dags; }
  DAG get_rep() { return rep_; }

private:
  DAG rep_ = DAG("");
  std::vector<DAG> dags;
};

class DataExtracter {
public:
  bool load_representatives(std::string);
  bool load_relationships(std::string);
  void print_loaded_representatives(std::string);
  void print_dag_to_hash(std::string);
  bool load_eccs(std::string, std::string);
  bool load_dag_to_label(std::string);
  void generate_QCIR_patterns();
  bool print_QCIR_patterns(std::string);
  bool QCIR_gate(bool &, std::string &, std::string &);
  void print_front_label(std::string);

public:
  std::unordered_map<CircuitSeqHashType, std::string> representatives; //NOT compact info
  std::unordered_map<int, std::unordered_set<int>> relationships;
  std::unordered_map<std::string, CircuitSeqHashType> dag_to_hash; //NOT compact info
  std::unordered_map<std::string, int> dag_to_label; //compact_info
  std::unordered_map<int, std::string> label_to_dag; //compact_info
  std::unordered_map<CircuitSeqHashType, ECC> eccs; //NOT compact info
  std::unordered_map<int, std::pair<std::string, std::string>> patterns; //non_rep to rep NOT compact info

public:
  std::unordered_map<std::string, std::string> single_gates = {
      {"x", "X"}, {"y", "Y"}, {"z", "Z"}, {"h", "H"}};
  std::unordered_map<std::string, std::string> binary_gates = {{"cx", "CNOT"},
                                                               {"rz", "RZ"}};
};
