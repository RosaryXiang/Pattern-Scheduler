OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg c[3];
z q[1];
h q[1];
cx q[0],q[1];
x q[0];
cx q[2],q[0];
cx q[0],q[2];