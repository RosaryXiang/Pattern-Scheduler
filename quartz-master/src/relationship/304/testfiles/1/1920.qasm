OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
creg c[2];
y q[1];
y q[1];
cx q[1],q[0];