OPENQASM 2.0;
include "qelib1.inc";
qreg q[12];
cx q[1],q[10];
cx q[0],q[11];
cx q[1],q[5];
t q[10];
cx q[0],q[7];
t q[11];
tdg q[5];
cx q[6],q[10];
tdg q[7];
h q[11];
cx q[1],q[5];
tdg q[10];
cx q[0],q[7];
t q[1];
t q[5];
t q[0];
t q[7];
cx q[1],q[9];
cx q[0],q[10];
tdg q[9];
t q[10];
cx q[4],q[9];
cx q[6],q[10];
t q[9];
tdg q[10];
cx q[1],q[9];
cx q[0],q[10];
cx q[1],q[4];
tdg q[9];
cx q[0],q[6];
t q[10];
t q[4];
cx q[5],q[9];
tdg q[6];
h q[10];
cx q[1],q[4];
tdg q[9];
cx q[0],q[6];
tdg q[1];
tdg q[4];
t q[0];
t q[6];
cx q[4],q[8];
cx q[0],q[9];
tdg q[8];
t q[9];
cx q[5],q[9];
tdg q[9];
cx q[0],q[9];
cx q[0],q[5];
t q[9];
tdg q[5];
h q[9];
cx q[0],q[5];
t q[0];
t q[5];
cx q[0],q[8];
t q[8];
cx q[4],q[8];
tdg q[8];
cx q[0],q[8];
cx q[0],q[4];
t q[8];
tdg q[4];
h q[8];
cx q[0],q[4];
t q[0];
t q[4];
