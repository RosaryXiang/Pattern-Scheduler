OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg c[3];
x q[0];
h q[0];
cx q[1],q[0];
z q[0];
cx q[1],q[2];
x q[2];
