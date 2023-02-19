OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
creg meas[10];
rz(pi/2) q[0];
rx1 q[0];
rz(pi/2) q[0];
rz(pi/2) q[1];
rx1 q[1];
rz(pi/2) q[1];
cz q[0],q[1];
rz(pi/2) q[2];
rx1 q[2];
rz(pi/2) q[2];
rz(pi/2) q[3];
rx1 q[3];
rz(pi/2) q[3];
cz q[2],q[3];
rz(pi/2) q[4];
rx1 q[4];
rz(pi/2) q[4];
cz q[3],q[4];
rz(pi/2) q[5];
rx1 q[5];
rz(pi/2) q[5];
cz q[0],q[5];
cz q[4],q[5];
rz(pi/2) q[6];
rx1 q[6];
rz(pi/2) q[6];
cz q[1],q[6];
cz q[2],q[6];
rz(pi/2) q[7];
rx1 q[7];
rz(pi/2) q[7];
rz(pi/2) q[8];
rx1 q[8];
rz(pi/2) q[8];
cz q[7],q[8];
rz(pi/2) q[9];
rx1 q[9];
rz(pi/2) q[9];
cz q[7],q[9];
cz q[8],q[9];
