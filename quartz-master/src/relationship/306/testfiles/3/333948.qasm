OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg c[3];
cx q[1],q[0];
y q[0];
cx q[1],q[0];
h q[1];
y q[2];
cx q[2],q[1];
