OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
cx q[1],q[0];
h q[1];
cx q[1],q[0];
h q[1];
cx q[1],q[0];
