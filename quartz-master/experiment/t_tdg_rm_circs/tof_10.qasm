OPENQASM 2.0;
include "qelib1.inc";
qreg q[19];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];
h q[16];
h q[17];
h q[18];
cx q[1],q[10];
tdg q[10];
cx q[0],q[10];
t q[10];
cx q[1],q[10];
tdg q[10];
cx q[0],q[10];
cx q[0],q[1];
t q[10];
cx q[0],q[1];
h q[10];
cx q[10],q[11];
tdg q[11];
cx q[2],q[11];
t q[11];
cx q[10],q[11];
tdg q[11];
cx q[2],q[11];
cx q[2],q[10];
t q[11];
cx q[2],q[10];
h q[11];
cx q[11],q[12];
tdg q[12];
cx q[3],q[12];
t q[12];
cx q[11],q[12];
tdg q[12];
cx q[3],q[12];
cx q[3],q[11];
t q[12];
cx q[3],q[11];
h q[12];
cx q[12],q[13];
tdg q[13];
cx q[4],q[13];
t q[13];
cx q[12],q[13];
tdg q[13];
cx q[4],q[13];
cx q[4],q[12];
t q[13];
cx q[4],q[12];
h q[13];
cx q[13],q[14];
tdg q[14];
cx q[5],q[14];
t q[14];
cx q[13],q[14];
tdg q[14];
cx q[5],q[14];
cx q[5],q[13];
t q[14];
cx q[5],q[13];
h q[14];
cx q[14],q[15];
tdg q[15];
cx q[6],q[15];
t q[15];
cx q[14],q[15];
tdg q[15];
cx q[6],q[15];
cx q[6],q[14];
t q[15];
cx q[6],q[14];
h q[15];
cx q[15],q[16];
tdg q[16];
cx q[7],q[16];
t q[16];
cx q[15],q[16];
tdg q[16];
cx q[7],q[16];
cx q[7],q[15];
t q[16];
cx q[7],q[15];
h q[16];
cx q[16],q[17];
tdg q[17];
cx q[8],q[17];
t q[17];
cx q[16],q[17];
tdg q[17];
cx q[8],q[17];
cx q[8],q[16];
t q[17];
cx q[8],q[16];
h q[17];
cx q[17],q[18];
tdg q[18];
cx q[9],q[18];
t q[18];
cx q[17],q[18];
tdg q[18];
cx q[9],q[18];
cx q[9],q[17];
t q[18];
tdg q[17];
h q[18];
cx q[9],q[17];
t q[9];
t q[17];
h q[17];
cx q[16],q[17];
t q[17];
cx q[8],q[17];
tdg q[17];
cx q[16],q[17];
t q[17];
cx q[8],q[17];
cx q[8],q[16];
tdg q[17];
cx q[8],q[16];
h q[17];
h q[16];
cx q[15],q[16];
t q[16];
cx q[7],q[16];
tdg q[16];
cx q[15],q[16];
t q[16];
cx q[7],q[16];
cx q[7],q[15];
tdg q[16];
cx q[7],q[15];
h q[16];
h q[15];
cx q[14],q[15];
t q[15];
cx q[6],q[15];
tdg q[15];
cx q[14],q[15];
t q[15];
cx q[6],q[15];
cx q[6],q[14];
tdg q[15];
cx q[6],q[14];
h q[15];
h q[14];
cx q[13],q[14];
t q[14];
cx q[5],q[14];
tdg q[14];
cx q[13],q[14];
t q[14];
cx q[5],q[14];
cx q[5],q[13];
tdg q[14];
cx q[5],q[13];
h q[14];
h q[13];
cx q[12],q[13];
t q[13];
cx q[4],q[13];
tdg q[13];
cx q[12],q[13];
t q[13];
cx q[4],q[13];
cx q[4],q[12];
tdg q[13];
cx q[4],q[12];
h q[13];
h q[12];
cx q[11],q[12];
t q[12];
cx q[3],q[12];
tdg q[12];
cx q[11],q[12];
t q[12];
cx q[3],q[12];
cx q[3],q[11];
tdg q[12];
cx q[3],q[11];
h q[12];
h q[11];
cx q[10],q[11];
t q[11];
cx q[2],q[11];
tdg q[11];
cx q[10],q[11];
t q[11];
cx q[2],q[11];
cx q[2],q[10];
tdg q[11];
cx q[2],q[10];
h q[11];
h q[10];
cx q[1],q[10];
t q[10];
cx q[0],q[10];
tdg q[10];
cx q[1],q[10];
t q[10];
cx q[0],q[10];
cx q[0],q[1];
tdg q[10];
cx q[0],q[1];
h q[10];
