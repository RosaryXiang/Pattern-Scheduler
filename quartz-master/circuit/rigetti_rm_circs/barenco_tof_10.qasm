OPENQASM 2.0;
include "qelib1.inc";
qreg q[19];
cz q[17],q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
rz(pi*-0.250000) q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
cz q[9],q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
rz(pi*0.250000) q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
cz q[17],q[18];
cz q[9],q[18];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[9],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*-0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[9],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*0.250000) q[17];
cz q[16],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*-0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[8],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[16],q[17];
cz q[8],q[17];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[8],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*-0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[8],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*0.250000) q[16];
cz q[15],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*-0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[7],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[15],q[16];
cz q[7],q[16];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[7],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*-0.250000) q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[7],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*0.250000) q[15];
cz q[14],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*-0.250000) q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[6],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*0.250000) q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[14],q[15];
cz q[6],q[15];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[6],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*-0.250000) q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[6],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*0.250000) q[14];
cz q[13],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*-0.250000) q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[5],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*0.250000) q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[13],q[14];
cz q[5],q[14];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[5],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*-0.250000) q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[5],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*0.250000) q[13];
cz q[12],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*-0.250000) q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[4],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*0.250000) q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[12],q[13];
cz q[4],q[13];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[4],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*-0.250000) q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[4],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*0.250000) q[12];
cz q[11],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*-0.250000) q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[3],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*0.250000) q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[11],q[12];
cz q[3],q[12];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[3],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*-0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[3],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*0.250000) q[11];
cz q[10],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*-0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[2],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[10],q[11];
cz q[2],q[11];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[2],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*-0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[2],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*0.250000) q[10];
cz q[1],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*-0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[0],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[1],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*-0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[0],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[10],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[2],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*-0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[10],q[11];
cz q[2],q[11];
cz q[11],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*0.250000) q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[3],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*-0.250000) q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[11],q[12];
cz q[3],q[12];
cz q[12],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*0.250000) q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[4],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*-0.250000) q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[12],q[13];
cz q[4],q[13];
cz q[13],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*0.250000) q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[5],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*-0.250000) q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[13],q[14];
cz q[5],q[14];
cz q[14],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*0.250000) q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[6],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*-0.250000) q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[14],q[15];
cz q[6],q[15];
cz q[15],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[7],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*-0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[15],q[16];
cz q[7],q[16];
cz q[16],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[8],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*-0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[16],q[17];
cz q[8],q[17];
cz q[17],q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
rz(pi*0.250000) q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
cz q[9],q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
rz(pi*-0.250000) q[18];
x q[18];
rz(pi*0.500000) q[18];
rx1 q[18];
rz(pi*-0.500000) q[18];
cz q[17],q[18];
cz q[9],q[18];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[9],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[9],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*-0.250000) q[17];
cz q[16],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*-0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[8],q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
rz(pi*0.250000) q[17];
x q[17];
rz(pi*0.500000) q[17];
rx1 q[17];
rz(pi*-0.500000) q[17];
cz q[16],q[17];
cz q[8],q[17];
cz q[15],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*-0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[7],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[15],q[16];
cz q[7],q[16];
cz q[14],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*-0.250000) q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[6],q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
rz(pi*0.250000) q[15];
x q[15];
rz(pi*0.500000) q[15];
rx1 q[15];
rz(pi*-0.500000) q[15];
cz q[14],q[15];
cz q[6],q[15];
cz q[13],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*-0.250000) q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[5],q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
rz(pi*0.250000) q[14];
x q[14];
rz(pi*0.500000) q[14];
rx1 q[14];
rz(pi*-0.500000) q[14];
cz q[13],q[14];
cz q[5],q[14];
cz q[12],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*-0.250000) q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[4],q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
rz(pi*0.250000) q[13];
x q[13];
rz(pi*0.500000) q[13];
rx1 q[13];
rz(pi*-0.500000) q[13];
cz q[12],q[13];
cz q[4],q[13];
cz q[11],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*-0.250000) q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[3],q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
rz(pi*0.250000) q[12];
x q[12];
rz(pi*0.500000) q[12];
rx1 q[12];
rz(pi*-0.500000) q[12];
cz q[11],q[12];
cz q[3],q[12];
cz q[10],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*-0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[2],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[10],q[11];
cz q[2],q[11];
cz q[1],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[0],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*-0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[1],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[0],q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
rz(pi*-0.250000) q[10];
x q[10];
rz(pi*0.500000) q[10];
rx1 q[10];
rz(pi*-0.500000) q[10];
cz q[10],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[2],q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
rz(pi*-0.250000) q[11];
x q[11];
rz(pi*0.500000) q[11];
rx1 q[11];
rz(pi*-0.500000) q[11];
cz q[10],q[11];
cz q[2],q[11];
x q[10];
cz q[11],q[12];
rz(pi*0.500000) q[10];
x q[12];
rx1 q[10];
rz(pi*0.500000) q[12];
rz(pi*-0.500000) q[10];
rx1 q[12];
cz q[2],q[10];
rz(pi*-0.500000) q[12];
x q[10];
rz(pi*0.250000) q[12];
rz(pi*0.500000) q[10];
x q[12];
rx1 q[10];
rz(pi*0.500000) q[12];
rz(pi*-0.500000) q[10];
rx1 q[12];
rz(pi*0.250000) q[10];
rz(pi*-0.500000) q[12];
x q[10];
cz q[3],q[12];
rz(pi*0.500000) q[10];
x q[12];
rx1 q[10];
rz(pi*0.500000) q[12];
rz(pi*-0.500000) q[10];
rx1 q[12];
cz q[2],q[10];
rz(pi*-0.500000) q[12];
x q[10];
rz(pi*-0.250000) q[12];
rz(pi*0.500000) q[10];
x q[12];
rx1 q[10];
rz(pi*0.500000) q[12];
rz(pi*-0.500000) q[10];
rx1 q[12];
rz(pi*-0.250000) q[10];
rz(pi*-0.500000) q[12];
cz q[11],q[12];
cz q[3],q[12];
x q[11];
cz q[12],q[13];
rz(pi*0.500000) q[11];
x q[13];
rx1 q[11];
rz(pi*0.500000) q[13];
rz(pi*-0.500000) q[11];
rx1 q[13];
cz q[3],q[11];
rz(pi*-0.500000) q[13];
x q[11];
rz(pi*0.250000) q[13];
rz(pi*0.500000) q[11];
x q[13];
rx1 q[11];
rz(pi*0.500000) q[13];
rz(pi*-0.500000) q[11];
rx1 q[13];
rz(pi*0.250000) q[11];
rz(pi*-0.500000) q[13];
x q[11];
cz q[4],q[13];
rz(pi*0.500000) q[11];
x q[13];
rx1 q[11];
rz(pi*0.500000) q[13];
rz(pi*-0.500000) q[11];
rx1 q[13];
cz q[3],q[11];
rz(pi*-0.500000) q[13];
x q[11];
rz(pi*-0.250000) q[13];
rz(pi*0.500000) q[11];
x q[13];
rx1 q[11];
rz(pi*0.500000) q[13];
rz(pi*-0.500000) q[11];
rx1 q[13];
rz(pi*-0.250000) q[11];
rz(pi*-0.500000) q[13];
cz q[12],q[13];
cz q[4],q[13];
x q[12];
cz q[13],q[14];
rz(pi*0.500000) q[12];
x q[14];
rx1 q[12];
rz(pi*0.500000) q[14];
rz(pi*-0.500000) q[12];
rx1 q[14];
cz q[4],q[12];
rz(pi*-0.500000) q[14];
x q[12];
rz(pi*0.250000) q[14];
rz(pi*0.500000) q[12];
x q[14];
rx1 q[12];
rz(pi*0.500000) q[14];
rz(pi*-0.500000) q[12];
rx1 q[14];
rz(pi*0.250000) q[12];
rz(pi*-0.500000) q[14];
x q[12];
cz q[5],q[14];
rz(pi*0.500000) q[12];
x q[14];
rx1 q[12];
rz(pi*0.500000) q[14];
rz(pi*-0.500000) q[12];
rx1 q[14];
cz q[4],q[12];
rz(pi*-0.500000) q[14];
x q[12];
rz(pi*-0.250000) q[14];
rz(pi*0.500000) q[12];
x q[14];
rx1 q[12];
rz(pi*0.500000) q[14];
rz(pi*-0.500000) q[12];
rx1 q[14];
rz(pi*-0.250000) q[12];
rz(pi*-0.500000) q[14];
cz q[13],q[14];
cz q[5],q[14];
x q[13];
cz q[14],q[15];
rz(pi*0.500000) q[13];
x q[15];
rx1 q[13];
rz(pi*0.500000) q[15];
rz(pi*-0.500000) q[13];
rx1 q[15];
cz q[5],q[13];
rz(pi*-0.500000) q[15];
x q[13];
rz(pi*0.250000) q[15];
rz(pi*0.500000) q[13];
x q[15];
rx1 q[13];
rz(pi*0.500000) q[15];
rz(pi*-0.500000) q[13];
rx1 q[15];
rz(pi*0.250000) q[13];
rz(pi*-0.500000) q[15];
x q[13];
cz q[6],q[15];
rz(pi*0.500000) q[13];
x q[15];
rx1 q[13];
rz(pi*0.500000) q[15];
rz(pi*-0.500000) q[13];
rx1 q[15];
cz q[5],q[13];
rz(pi*-0.500000) q[15];
x q[13];
rz(pi*-0.250000) q[15];
rz(pi*0.500000) q[13];
x q[15];
rx1 q[13];
rz(pi*0.500000) q[15];
rz(pi*-0.500000) q[13];
rx1 q[15];
rz(pi*-0.250000) q[13];
rz(pi*-0.500000) q[15];
cz q[14],q[15];
cz q[6],q[15];
x q[14];
cz q[15],q[16];
rz(pi*0.500000) q[14];
x q[16];
rx1 q[14];
rz(pi*0.500000) q[16];
rz(pi*-0.500000) q[14];
rx1 q[16];
cz q[6],q[14];
rz(pi*-0.500000) q[16];
x q[14];
rz(pi*0.250000) q[16];
rz(pi*0.500000) q[14];
x q[16];
rx1 q[14];
rz(pi*0.500000) q[16];
rz(pi*-0.500000) q[14];
rx1 q[16];
rz(pi*0.250000) q[14];
rz(pi*-0.500000) q[16];
x q[14];
cz q[7],q[16];
rz(pi*0.500000) q[14];
x q[16];
rx1 q[14];
rz(pi*0.500000) q[16];
rz(pi*-0.500000) q[14];
rx1 q[16];
cz q[6],q[14];
rz(pi*-0.500000) q[16];
x q[14];
rz(pi*-0.250000) q[16];
rz(pi*0.500000) q[14];
x q[16];
rx1 q[14];
rz(pi*0.500000) q[16];
rz(pi*-0.500000) q[14];
rx1 q[16];
rz(pi*-0.250000) q[14];
rz(pi*-0.500000) q[16];
cz q[15],q[16];
cz q[7],q[16];
x q[15];
cz q[16],q[17];
rz(pi*0.500000) q[15];
x q[17];
rx1 q[15];
rz(pi*0.500000) q[17];
rz(pi*-0.500000) q[15];
rx1 q[17];
cz q[7],q[15];
rz(pi*-0.500000) q[17];
x q[15];
rz(pi*0.250000) q[17];
rz(pi*0.500000) q[15];
x q[17];
rx1 q[15];
rz(pi*0.500000) q[17];
rz(pi*-0.500000) q[15];
rx1 q[17];
rz(pi*0.250000) q[15];
rz(pi*-0.500000) q[17];
x q[15];
cz q[8],q[17];
rz(pi*0.500000) q[15];
x q[17];
rx1 q[15];
rz(pi*0.500000) q[17];
rz(pi*-0.500000) q[15];
rx1 q[17];
cz q[7],q[15];
rz(pi*-0.500000) q[17];
x q[15];
rz(pi*-0.250000) q[17];
rz(pi*0.500000) q[15];
x q[17];
rx1 q[15];
rz(pi*0.500000) q[17];
rz(pi*-0.500000) q[15];
rx1 q[17];
rz(pi*-0.250000) q[15];
rz(pi*-0.500000) q[17];
cz q[16],q[17];
cz q[8],q[17];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[8],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*0.250000) q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
cz q[8],q[16];
x q[16];
rz(pi*0.500000) q[16];
rx1 q[16];
rz(pi*-0.500000) q[16];
rz(pi*-0.250000) q[16];
