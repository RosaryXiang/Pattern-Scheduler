OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
h q[6];
h q[7];
h q[8];
cx q[2],q[7];
tdg q[7];
cx q[0],q[7];
t q[7];
cx q[2],q[7];
tdg q[7];
cx q[0],q[7];
cx q[0],q[2];
t q[7];
tdg q[2];
h q[7];
cx q[0],q[2];
cx q[7],q[6];
t q[0];
t q[2];
tdg q[6];
x q[0];
x q[2];
cx q[1],q[6];
cx q[2],q[8];
t q[6];
t q[8];
cx q[7],q[6];
cx q[0],q[8];
tdg q[6];
tdg q[8];
cx q[1],q[6];
cx q[2],q[8];
cx q[1],q[7];
t q[6];
t q[8];
tdg q[7];
h q[6];
cx q[0],q[8];
cx q[1],q[7];
cx q[6],q[5];
cx q[0],q[2];
tdg q[8];
t q[1];
t q[7];
cx q[6],q[3];
t q[2];
h q[8];
x q[1];
h q[3];
h q[6];
cx q[0],q[2];
cx q[8],q[7];
tdg q[0];
tdg q[2];
x q[7];
cx q[8],q[6];
cx q[7],q[3];
t q[6];
tdg q[3];
cx q[1],q[6];
tdg q[6];
cx q[8],q[6];
t q[6];
cx q[1],q[6];
cx q[1],q[8];
tdg q[6];
t q[8];
h q[6];
cx q[1],q[8];
cx q[6],q[4];
tdg q[1];
tdg q[8];
cx q[1],q[3];
cx q[5],q[8];
t q[3];
h q[5];
h q[8];
cx q[7],q[3];
cx q[2],q[8];
tdg q[3];
tdg q[8];
cx q[1],q[3];
cx q[0],q[8];
cx q[1],q[7];
t q[3];
t q[8];
tdg q[7];
h q[3];
cx q[2],q[8];
cx q[1],q[7];
tdg q[8];
t q[1];
t q[7];
cx q[0],q[8];
x q[1];
cx q[7],q[5];
cx q[0],q[2];
t q[8];
t q[5];
tdg q[2];
h q[8];
cx q[1],q[5];
cx q[0],q[2];
tdg q[5];
t q[0];
t q[2];
cx q[7],q[5];
x q[0];
t q[5];
cx q[1],q[5];
cx q[1],q[7];
tdg q[5];
t q[7];
h q[5];
cx q[1],q[7];
cx q[5],q[8];
tdg q[1];
tdg q[7];
x q[7];
