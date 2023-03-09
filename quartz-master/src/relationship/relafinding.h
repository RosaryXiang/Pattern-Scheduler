#include "quartz/circuitseq/circuitseq.h"
#include <unordered_map>
#include <unordered_set>
#include <vector>
using CircuitSeqHashType = unsigned long long;

class ECC {
public:
  ECC(std::string content) { dag = content; }
  std::string content() { return dag; }
  void print_info();
  void extract_info();

private:
  std::string dag;
  std::vector<std::pair<std::string , std::vector<std::string>>> gate_info;
  int gate_num = 0;
  int qubit_num = 0;
  int para_num = 0;
};

class ECCSet {
public:
  void push_dag(std::string dag) { dags.push_back(ECC(dag)); }
  void clear() { dags.clear(); }
  std::vector<ECC> get_dags() { return dags; }

private:
  std::vector<ECC> dags;
};

class DataExtracter {
public:
  bool load_representatives(std::string);
  void print_loaded_representatives(std::string);
  void print_dag_to_hash(std::string);
  void add_relationship(CircuitSeqHashType repFather,
                        std::vector<CircuitSeqHashType> &repChildren);
  bool load_relationships(std::string);
  void print_loaded_relationships(std::string);
  bool load_eccs(std::string, std::string);
  bool print_QCIR_patterns(std::string);

public:
  std::unordered_map<CircuitSeqHashType, std::string> representatives;
  std::unordered_map<CircuitSeqHashType, std::vector<CircuitSeqHashType>>
      relationships;
  std::unordered_map<std::string, CircuitSeqHashType> dag_to_hash;
  std::unordered_map<CircuitSeqHashType, ECCSet> eccs;
};
