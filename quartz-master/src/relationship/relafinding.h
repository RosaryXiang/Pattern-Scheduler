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

public:
  bool valid = false; 
  std::string dag;
  // first string = gate type
  // vector<string> = vector of op
  std::vector<std::pair<std::string, std::vector<std::string>>> gate_info;
  int gate_num = 0;
  int qubit_num = 0;
  int para_num = 0;
  int cost = 0;
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
  void generate_reverse_rela();
  void print_loaded_representatives(std::string);
  void print_dag_to_hash(std::string);
  bool load_eccs(std::string, std::string);
  bool load_dag_to_label(std::string);
  void generate_patterns();
  void classify_patterns_by_gate_num();
  bool print_QCIR_patterns(std::string);  //rarely used!
  bool print_QCIR_patterns_with_cost_limit(std::string);
  bool QCIR_gate(bool &, std::string &, std::string &);
  void print_front_label_for_inclusion_patterns(std::string, int);
  void print_general_front_label(std::string);
  void link(bool&&, const int &, const std::unordered_set<int> &);
  void generate_relationships_between_patterns(std::string);
  void generate_testfiles_of_inclusion_patterns(std::string);

public:
  int max_gate_num =0;
  std::unordered_map<CircuitSeqHashType, std::string> representatives; 
  std::unordered_map<int, std::unordered_set<int>> relationships;
  std::unordered_map<int, std::unordered_set<int>> pattern_relationships_with_cost_limit;
  std::unordered_map<std::string, CircuitSeqHashType> dag_to_hash; 
  std::unordered_map<std::string, int> dag_to_label; 
  std::unordered_map<int, std::string> label_to_dag; 
  std::unordered_map<CircuitSeqHashType, ECC> eccs; 
  std::unordered_map<int, int> patterns;  //norep to rep  rarely used!
  std::unordered_map<int, int> patterns_with_cost_limit;  //norep to rep
  std::unordered_map<int, std::unordered_set<int>> patterns_clustered_by_gate_num;
  std::unordered_set<int> general_front_labels;
  std::unordered_set<int> front_labels_for_inclusion_patterns;
public:
  std::unordered_map<std::string, std::string> single_gates = {
      {"x", "X"}, {"y", "Y"}, {"z", "Z"}, {"h", "H"}};
  std::unordered_map<std::string, std::string> binary_gates = {{"cx", "CNOT"},
                                                               {"rz", "RZ"}};
};
