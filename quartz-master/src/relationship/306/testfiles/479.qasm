OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg c[3];
y q[0];
y q[0];
cx q[0],q[2];
