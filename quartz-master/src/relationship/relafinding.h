#include "quartz/circuitseq/circuitseq.h"
#include <unordered_map>
#include <unordered_set>
#include <vector>
using CircuitSeqHashType = unsigned long long;

class DAG {
public:
  DAG(std::string content) { dag = content; }
  std::string content() { return dag; }
  void print_info(std::string);
  void extract_info();

public:
  std::string dag;
  //first string = gate type
  //vector<string> = vector of op
  std::vector<std::pair<std::string, std::vector<std::string>>> gate_info;
  int gate_num = 0;
  int qubit_num = 0;
  int para_num = 0;
};

class ECC {
public:
  void push_dag(std::string dag) { dags.push_back(DAG(dag)); }
  void clear() { dags.clear(); }
  void set_rep(DAG rep){rep_ = rep;}
  std::vector<DAG> get_dags() { return dags; }
  DAG get_rep(){return rep_;}

private:
  DAG rep_ = DAG("");
  std::vector<DAG> dags;
};

class DataExtracter {
public:
  bool load_representatives(std::string);
  void print_loaded_representatives(std::string);
  void print_dag_to_hash(std::string);
  void add_relationship(CircuitSeqHashType repFather,
                        std::vector<CircuitSeqHashType> &repChildren);
  bool load_relationships(std::string);
  void clean_wrongly_linked_rela();
  void print_loaded_relationships(std::string);
  void print_front_rep(std::string);
  bool load_eccs(std::string, std::string);
  bool print_QCIR_patterns(std::string);
  bool QCIR_gate(bool &, std::string &, std::string &);
  void print_rela_in_eccs(std::string);

public:
  std::unordered_map<CircuitSeqHashType, std::string> representatives;
  std::unordered_map<std::string, std::unordered_set<std::string>>
      relationships;
  std::unordered_map<std::string, CircuitSeqHashType> dag_to_hash;
  std::unordered_map<CircuitSeqHashType, ECC> eccs;

public:
  std::unordered_map<std::string, std::string> single_gates = {
      {"x", "X"}, {"y", "Y"}, {"z", "Z"}, {"h", "H"}};
  std::unordered_map<std::string, std::string> binary_gates = {{"cx", "CNOT"},
                                                               {"rz", "RZ"}};
};
