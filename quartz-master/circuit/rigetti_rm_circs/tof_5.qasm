OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cz q[1],q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
rz(pi*-0.250000) q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
cz q[0],q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
rz(pi*0.250000) q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
cz q[1],q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
rz(pi*-0.250000) q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
cz q[0],q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
rz(pi*0.250000) q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
cz q[5],q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
rz(pi*-0.250000) q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
cz q[2],q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
rz(pi*0.250000) q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
cz q[5],q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
rz(pi*-0.250000) q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
cz q[2],q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
rz(pi*0.250000) q[6];
x q[6];
rz(pi*0.500000) q[6];
rx1 q[6];
rz(pi*-0.500000) q[6];
cz q[6],q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
rz(pi*-0.250000) q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
cz q[3],q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
rz(pi*0.250000) q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
cz q[6],q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
rz(pi*-0.250000) q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
cz q[3],q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
rz(pi*0.250000) q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
cz q[7],q[8];
x q[8];
rz(pi*0.500000) q[8];
rx1 q[8];
rz(pi*-0.500000) q[8];
rz(pi*-0.250000) q[8];
x q[8];
rz(pi*0.500000) q[8];
rx1 q[8];
rz(pi*-0.500000) q[8];
cz q[4],q[8];
x q[8];
rz(pi*0.500000) q[8];
rx1 q[8];
rz(pi*-0.500000) q[8];
rz(pi*0.250000) q[8];
x q[8];
rz(pi*0.500000) q[8];
rx1 q[8];
rz(pi*-0.500000) q[8];
cz q[7],q[8];
x q[8];
x q[7];
rz(pi*0.500000) q[8];
rz(pi*0.500000) q[7];
rx1 q[8];
rx1 q[7];
rz(pi*-0.500000) q[8];
rz(pi*-0.500000) q[7];
rz(pi*-0.250000) q[8];
x q[8];
rz(pi*0.500000) q[8];
rx1 q[8];
rz(pi*-0.500000) q[8];
cz q[4],q[8];
cz q[4],q[7];
x q[8];
x q[7];
rz(pi*0.500000) q[8];
rz(pi*0.500000) q[7];
rx1 q[8];
rx1 q[7];
rz(pi*-0.500000) q[8];
rz(pi*-0.500000) q[7];
rz(pi*0.250000) q[8];
rz(pi*-0.250000) q[7];
x q[8];
x q[7];
rz(pi*0.500000) q[8];
rz(pi*0.500000) q[7];
rx1 q[8];
rx1 q[7];
rz(pi*-0.500000) q[8];
rz(pi*-0.500000) q[7];
cz q[4],q[7];
rz(pi*0.250000) q[4];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
rz(pi*0.250000) q[7];
cz q[6],q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
rz(pi*0.250000) q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
cz q[3],q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
rz(pi*-0.250000) q[7];
x q[7];
rz(pi*0.500000) q[7];
rx1 q[7];
rz(pi*-0.500000) q[7];
cz q[6],q[7];
cz q[5],q[6];
x q[7];
x q[6];
rz(pi*0.500000) q[7];
rz(pi*0.500000) q[6];
rx1 q[7];
rx1 q[6];
rz(pi*-0.500000) q[7];
rz(pi*-0.500000) q[6];
rz(pi*0.250000) q[7];
rz(pi*0.250000) q[6];
x q[7];
x q[6];
rz(pi*0.500000) q[7];
rz(pi*0.500000) q[6];
rx1 q[7];
rx1 q[6];
rz(pi*-0.500000) q[7];
rz(pi*-0.500000) q[6];
cz q[3],q[7];
cz q[2],q[6];
x q[7];
x q[6];
rz(pi*0.500000) q[7];
rz(pi*0.500000) q[6];
rx1 q[7];
rx1 q[6];
rz(pi*-0.500000) q[7];
rz(pi*-0.500000) q[6];
rz(pi*-0.250000) q[7];
rz(pi*-0.250000) q[6];
x q[7];
x q[6];
rz(pi*0.500000) q[7];
rz(pi*0.500000) q[6];
rx1 q[7];
rx1 q[6];
rz(pi*-0.500000) q[7];
rz(pi*-0.500000) q[6];
cz q[5],q[6];
cz q[1],q[5];
x q[6];
x q[5];
rz(pi*0.500000) q[6];
rz(pi*0.500000) q[5];
rx1 q[6];
rx1 q[5];
rz(pi*-0.500000) q[6];
rz(pi*-0.500000) q[5];
rz(pi*0.250000) q[6];
rz(pi*0.250000) q[5];
x q[6];
x q[5];
rz(pi*0.500000) q[6];
rz(pi*0.500000) q[5];
rx1 q[6];
rx1 q[5];
rz(pi*-0.500000) q[6];
rz(pi*-0.500000) q[5];
cz q[2],q[6];
cz q[0],q[5];
x q[6];
x q[5];
rz(pi*0.500000) q[6];
rz(pi*0.500000) q[5];
rx1 q[6];
rx1 q[5];
rz(pi*-0.500000) q[6];
rz(pi*-0.500000) q[5];
rz(pi*-0.250000) q[6];
rz(pi*-0.250000) q[5];
x q[6];
x q[5];
rz(pi*0.500000) q[6];
rz(pi*0.500000) q[5];
rx1 q[6];
rx1 q[5];
rz(pi*-0.500000) q[6];
rz(pi*-0.500000) q[5];
cz q[1],q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
rz(pi*0.250000) q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
cz q[0],q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
rz(pi*-0.250000) q[5];
x q[5];
rz(pi*0.500000) q[5];
rx1 q[5];
rz(pi*-0.500000) q[5];
