OPENQASM 2.0;
include "qelib1.inc";
qreg q[24];
cx q[3],q[2];
cx q[8],q[7];
h q[10];
cx q[14],q[13];
h q[16];
h q[17];
cx q[21],q[20];
h q[23];
rz(pi*0.250000) q[5];
cx q[3],q[4];
cx q[8],q[9];
cx q[14],q[15];
cx q[21],q[22];
h q[3];
h q[4];
h q[8];
h q[9];
h q[14];
h q[21];
h q[22];
cx q[1],q[3];
cx q[6],q[8];
cx q[12],q[14];
cx q[19],q[21];
rz(pi*-0.250000) q[3];
rz(pi*0.250000) q[1];
rz(pi*-0.250000) q[8];
rz(pi*-0.250000) q[14];
rz(pi*-0.250000) q[21];
rz(pi*0.250000) q[19];
cx q[0],q[3];
cx q[5],q[8];
cx q[11],q[14];
cx q[18],q[21];
rz(pi*0.250000) q[3];
rz(pi*0.250000) q[8];
rz(pi*0.250000) q[14];
rz(pi*0.250000) q[11];
rz(pi*0.250000) q[21];
rz(pi*0.250000) q[18];
cx q[1],q[3];
cx q[6],q[8];
cx q[12],q[14];
cx q[19],q[21];
rz(pi*-0.250000) q[3];
rz(pi*-0.250000) q[8];
rz(pi*-0.250000) q[14];
rz(pi*0.250000) q[12];
rz(pi*-0.250000) q[21];
cx q[0],q[3];
cx q[5],q[8];
cx q[11],q[14];
cx q[18],q[21];
rz(pi*0.250000) q[3];
cx q[0],q[1];
rz(pi*0.250000) q[8];
cx q[6],q[5];
rz(pi*0.250000) q[14];
cx q[12],q[11];
rz(pi*0.250000) q[21];
cx q[19],q[18];
h q[3];
rz(pi*-0.250000) q[1];
h q[8];
rz(pi*-0.250000) q[5];
cx q[15],q[14];
rz(pi*-0.250000) q[11];
h q[21];
rz(pi*-0.250000) q[18];
cx q[3],q[4];
cx q[0],q[1];
cx q[8],q[9];
h q[14];
h q[15];
cx q[21],q[22];
rz(pi*-0.250000) q[4];
rz(pi*-0.250000) q[9];
rz(pi*-0.250000) q[15];
rz(pi*-0.250000) q[22];
cx q[2],q[4];
cx q[7],q[9];
cx q[13],q[15];
cx q[20],q[22];
rz(pi*0.250000) q[4];
rz(pi*0.250000) q[9];
rz(pi*0.250000) q[15];
rz(pi*0.250000) q[22];
cx q[3],q[4];
cx q[8],q[9];
cx q[14],q[15];
cx q[21],q[22];
rz(pi*-0.250000) q[4];
rz(pi*-0.250000) q[9];
cx q[8],q[10];
rz(pi*-0.250000) q[15];
rz(pi*-0.250000) q[22];
cx q[21],q[23];
cx q[2],q[4];
cx q[7],q[9];
rz(pi*0.250000) q[10];
cx q[13],q[15];
cx q[20],q[22];
rz(pi*0.250000) q[23];
rz(pi*0.250000) q[4];
cx q[3],q[2];
rz(pi*0.250000) q[9];
cx q[7],q[8];
cx q[13],q[14];
rz(pi*0.250000) q[15];
rz(pi*0.250000) q[22];
cx q[20],q[21];
h q[4];
rz(pi*-0.250000) q[2];
rz(pi*-0.250000) q[8];
rz(pi*-0.250000) q[14];
h q[15];
rz(pi*-0.250000) q[21];
cx q[3],q[2];
cx q[7],q[8];
cx q[13],q[14];
cx q[20],q[21];
rz(pi*0.250000) q[2];
rz(pi*0.250000) q[3];
cx q[7],q[10];
cx q[14],q[16];
cx q[20],q[23];
h q[3];
rz(pi*-0.250000) q[10];
rz(pi*0.250000) q[16];
rz(pi*-0.250000) q[23];
rz(pi*0.250000) q[20];
cx q[1],q[3];
cx q[8],q[10];
cx q[13],q[16];
cx q[21],q[23];
rz(pi*0.250000) q[3];
rz(pi*0.250000) q[10];
rz(pi*-0.250000) q[16];
rz(pi*0.250000) q[23];
cx q[0],q[3];
cx q[7],q[10];
cx q[14],q[16];
cx q[20],q[23];
rz(pi*-0.250000) q[3];
rz(pi*-0.250000) q[10];
cx q[7],q[8];
rz(pi*0.250000) q[16];
rz(pi*-0.250000) q[23];
cx q[20],q[21];
cx q[1],q[3];
rz(pi*0.250000) q[8];
cx q[13],q[16];
rz(pi*0.250000) q[21];
rz(pi*0.250000) q[3];
cx q[5],q[8];
rz(pi*-0.250000) q[16];
cx q[14],q[13];
cx q[20],q[21];
cx q[0],q[3];
cx q[7],q[8];
rz(pi*0.250000) q[13];
cx q[18],q[21];
rz(pi*-0.250000) q[3];
cx q[1],q[0];
cx q[8],q[10];
cx q[14],q[13];
cx q[21],q[23];
h q[3];
rz(pi*0.250000) q[0];
rz(pi*-0.250000) q[10];
rz(pi*0.250000) q[8];
cx q[11],q[14];
rz(pi*-0.250000) q[23];
cx q[3],q[2];
cx q[1],q[0];
cx q[7],q[10];
rz(pi*0.250000) q[14];
cx q[20],q[23];
h q[3];
rz(pi*0.250000) q[10];
cx q[14],q[16];
rz(pi*0.250000) q[23];
cx q[1],q[3];
cx q[8],q[10];
rz(pi*-0.250000) q[16];
cx q[21],q[23];
rz(pi*-0.250000) q[3];
rz(pi*-0.250000) q[10];
cx q[13],q[16];
rz(pi*-0.250000) q[23];
cx q[0],q[3];
cx q[7],q[10];
rz(pi*0.250000) q[16];
cx q[20],q[23];
rz(pi*0.250000) q[3];
rz(pi*0.250000) q[10];
cx q[14],q[16];
rz(pi*0.250000) q[23];
cx q[21],q[20];
cx q[1],q[3];
h q[10];
rz(pi*-0.250000) q[16];
h q[23];
rz(pi*-0.250000) q[20];
rz(pi*-0.250000) q[3];
rz(pi*-0.250000) q[10];
cx q[13],q[16];
cx q[23],q[17];
cx q[21],q[20];
cx q[0],q[3];
cx q[10],q[9];
rz(pi*0.250000) q[16];
cx q[14],q[13];
rz(pi*-0.250000) q[17];
rz(pi*0.250000) q[3];
cx q[1],q[0];
rz(pi*0.250000) q[9];
h q[16];
rz(pi*-0.250000) q[13];
h q[3];
rz(pi*-0.250000) q[0];
cx q[4],q[9];
cx q[16],q[17];
cx q[14],q[13];
cx q[3],q[2];
cx q[1],q[0];
rz(pi*-0.250000) q[9];
rz(pi*-0.250000) q[4];
rz(pi*0.250000) q[17];
rz(pi*0.250000) q[16];
x q[2];
h q[3];
cx q[10],q[9];
cx q[23],q[17];
cx q[1],q[3];
rz(pi*0.250000) q[9];
rz(pi*-0.250000) q[17];
cx q[23],q[22];
rz(pi*0.250000) q[3];
cx q[4],q[9];
cx q[16],q[17];
rz(pi*0.250000) q[22];
cx q[0],q[3];
rz(pi*-0.250000) q[9];
cx q[4],q[10];
rz(pi*0.250000) q[17];
cx q[23],q[16];
cx q[15],q[22];
rz(pi*-0.250000) q[3];
h q[9];
rz(pi*0.250000) q[10];
h q[17];
rz(pi*-0.250000) q[16];
rz(pi*-0.250000) q[22];
cx q[1],q[3];
cx q[4],q[10];
cx q[23],q[16];
rz(pi*0.250000) q[3];
h q[10];
cx q[23],q[22];
cx q[0],q[3];
cx q[8],q[10];
rz(pi*0.250000) q[22];
rz(pi*-0.250000) q[3];
cx q[1],q[0];
rz(pi*0.250000) q[10];
cx q[8],q[7];
cx q[15],q[22];
h q[3];
rz(pi*0.250000) q[0];
rz(pi*-0.250000) q[7];
rz(pi*-0.250000) q[22];
cx q[3],q[2];
x q[0];
cx q[8],q[7];
cx q[17],q[22];
h q[3];
cx q[7],q[10];
rz(pi*-0.250000) q[22];
cx q[1],q[3];
rz(pi*-0.250000) q[10];
cx q[9],q[22];
rz(pi*-0.250000) q[3];
cx q[8],q[10];
rz(pi*0.250000) q[22];
cx q[0],q[3];
rz(pi*0.250000) q[10];
cx q[17],q[22];
rz(pi*0.250000) q[3];
rz(pi*0.250000) q[0];
cx q[7],q[10];
rz(pi*-0.250000) q[22];
cx q[9],q[17];
cx q[1],q[3];
rz(pi*-0.250000) q[10];
cx q[8],q[7];
rz(pi*-0.250000) q[17];
rz(pi*-0.250000) q[3];
rz(pi*0.250000) q[7];
rz(pi*-0.250000) q[8];
cx q[9],q[17];
cx q[0],q[3];
cx q[8],q[7];
rz(pi*0.250000) q[17];
rz(pi*0.250000) q[3];
cx q[1],q[0];
cx q[5],q[8];
h q[17];
h q[3];
rz(pi*-0.250000) q[0];
cx q[8],q[10];
cx q[6],q[5];
cx q[23],q[17];
rz(pi*0.250000) q[3];
cx q[1],q[0];
rz(pi*-0.250000) q[10];
rz(pi*-0.250000) q[5];
rz(pi*0.250000) q[17];
cx q[23],q[15];
cx q[7],q[10];
rz(pi*0.250000) q[15];
rz(pi*0.250000) q[10];
rz(pi*0.250000) q[7];
cx q[23],q[15];
cx q[8],q[10];
rz(pi*-0.250000) q[15];
rz(pi*-0.250000) q[23];
rz(pi*-0.250000) q[10];
h q[15];
cx q[7],q[10];
cx q[16],q[15];
rz(pi*0.250000) q[10];
cx q[7],q[8];
rz(pi*0.250000) q[15];
rz(pi*-0.250000) q[16];
rz(pi*-0.250000) q[8];
cx q[9],q[15];
cx q[7],q[8];
rz(pi*-0.250000) q[15];
cx q[9],q[22];
rz(pi*0.250000) q[8];
cx q[16],q[15];
rz(pi*0.250000) q[22];
h q[8];
rz(pi*0.250000) q[15];
h q[22];
cx q[6],q[8];
cx q[9],q[15];
rz(pi*0.250000) q[8];
rz(pi*-0.250000) q[15];
cx q[9],q[16];
cx q[5],q[8];
h q[15];
rz(pi*0.250000) q[16];
rz(pi*-0.250000) q[8];
cx q[9],q[16];
cx q[6],q[8];
cx q[16],q[17];
rz(pi*0.250000) q[8];
rz(pi*-0.250000) q[17];
rz(pi*-0.250000) q[16];
cx q[5],q[8];
cx q[23],q[17];
rz(pi*-0.250000) q[8];
cx q[6],q[5];
rz(pi*0.250000) q[17];
h q[8];
rz(pi*0.250000) q[5];
cx q[16],q[17];
cx q[8],q[7];
rz(pi*-0.250000) q[17];
cx q[16],q[23];
cx q[6],q[8];
h q[17];
rz(pi*0.250000) q[23];
h q[16];
cx q[4],q[6];
h q[8];
h q[23];
cx q[14],q[16];
cx q[6],q[8];
rz(pi*-0.250000) q[14];
cx q[23],q[16];
rz(pi*-0.250000) q[8];
rz(pi*0.250000) q[16];
cx q[21],q[23];
cx q[5],q[8];
cx q[13],q[16];
rz(pi*0.250000) q[23];
rz(pi*0.250000) q[8];
rz(pi*-0.250000) q[16];
cx q[20],q[23];
cx q[6],q[8];
cx q[14],q[16];
rz(pi*-0.250000) q[23];
rz(pi*-0.250000) q[8];
rz(pi*0.250000) q[16];
cx q[21],q[23];
cx q[5],q[8];
cx q[13],q[16];
rz(pi*0.250000) q[23];
rz(pi*0.250000) q[8];
cx q[6],q[5];
rz(pi*-0.250000) q[16];
cx q[13],q[14];
cx q[20],q[23];
h q[8];
rz(pi*-0.250000) q[5];
rz(pi*0.250000) q[14];
rz(pi*-0.250000) q[23];
cx q[20],q[21];
cx q[8],q[7];
cx q[6],q[5];
cx q[13],q[14];
rz(pi*0.250000) q[21];
x q[7];
h q[8];
cx q[11],q[14];
cx q[20],q[21];
cx q[6],q[8];
cx q[12],q[11];
cx q[14],q[16];
cx q[18],q[21];
rz(pi*0.250000) q[8];
rz(pi*-0.250000) q[16];
cx q[19],q[18];
cx q[21],q[23];
cx q[5],q[8];
cx q[13],q[16];
rz(pi*-0.250000) q[23];
rz(pi*0.250000) q[21];
rz(pi*-0.250000) q[8];
rz(pi*0.250000) q[16];
rz(pi*0.250000) q[13];
cx q[20],q[23];
cx q[6],q[8];
cx q[14],q[16];
rz(pi*0.250000) q[23];
rz(pi*0.250000) q[8];
rz(pi*-0.250000) q[16];
rz(pi*0.250000) q[14];
cx q[21],q[23];
cx q[5],q[8];
cx q[13],q[16];
rz(pi*-0.250000) q[23];
rz(pi*-0.250000) q[8];
cx q[6],q[5];
rz(pi*0.250000) q[16];
cx q[14],q[13];
cx q[20],q[23];
h q[8];
cx q[4],q[6];
rz(pi*0.250000) q[5];
rz(pi*-0.250000) q[13];
rz(pi*0.250000) q[23];
cx q[20],q[21];
cx q[6],q[8];
cx q[14],q[13];
h q[23];
rz(pi*-0.250000) q[21];
cx q[6],q[5];
cx q[8],q[7];
h q[14];
cx q[20],q[21];
x q[5];
h q[8];
cx q[12],q[14];
h q[21];
cx q[6],q[8];
rz(pi*0.250000) q[14];
rz(pi*-0.250000) q[12];
cx q[19],q[21];
rz(pi*-0.250000) q[8];
cx q[11],q[14];
rz(pi*0.250000) q[21];
rz(pi*-0.250000) q[19];
cx q[5],q[8];
rz(pi*-0.250000) q[14];
cx q[18],q[21];
rz(pi*0.250000) q[8];
rz(pi*0.250000) q[5];
cx q[12],q[14];
rz(pi*-0.250000) q[21];
rz(pi*-0.250000) q[18];
cx q[6],q[8];
rz(pi*0.250000) q[14];
cx q[19],q[21];
rz(pi*-0.250000) q[8];
cx q[11],q[14];
rz(pi*0.250000) q[21];
cx q[5],q[8];
rz(pi*-0.250000) q[14];
rz(pi*-0.250000) q[11];
cx q[18],q[21];
rz(pi*0.250000) q[8];
cx q[6],q[5];
h q[14];
cx q[12],q[11];
rz(pi*-0.250000) q[21];
cx q[19],q[18];
h q[8];
rz(pi*-0.250000) q[5];
rz(pi*0.250000) q[6];
cx q[14],q[13];
rz(pi*0.250000) q[11];
h q[21];
rz(pi*0.250000) q[18];
cx q[8],q[10];
cx q[12],q[14];
cx q[21],q[20];
rz(pi*0.250000) q[10];
cx q[9],q[12];
h q[14];
cx q[19],q[21];
cx q[7],q[10];
cx q[12],q[14];
cx q[15],q[19];
h q[21];
rz(pi*-0.250000) q[10];
rz(pi*-0.250000) q[14];
cx q[19],q[21];
cx q[8],q[10];
cx q[11],q[14];
rz(pi*-0.250000) q[21];
rz(pi*0.250000) q[10];
rz(pi*-0.250000) q[8];
rz(pi*0.250000) q[14];
cx q[18],q[21];
cx q[7],q[10];
cx q[12],q[14];
rz(pi*0.250000) q[21];
rz(pi*-0.250000) q[10];
cx q[7],q[8];
rz(pi*-0.250000) q[14];
cx q[11],q[12];
cx q[19],q[21];
rz(pi*0.250000) q[8];
rz(pi*-0.250000) q[12];
rz(pi*-0.250000) q[21];
cx q[7],q[8];
cx q[11],q[12];
cx q[18],q[21];
cx q[5],q[8];
rz(pi*-0.250000) q[7];
cx q[11],q[14];
rz(pi*0.250000) q[21];
cx q[18],q[19];
cx q[8],q[10];
rz(pi*0.250000) q[14];
h q[21];
rz(pi*-0.250000) q[19];
rz(pi*-0.250000) q[10];
h q[14];
cx q[21],q[20];
cx q[18],q[19];
cx q[7],q[10];
cx q[14],q[13];
h q[21];
rz(pi*0.250000) q[10];
h q[14];
x q[13];
cx q[19],q[21];
cx q[8],q[10];
cx q[12],q[14];
rz(pi*0.250000) q[21];
rz(pi*-0.250000) q[10];
cx q[8],q[7];
rz(pi*0.250000) q[14];
cx q[18],q[21];
rz(pi*-0.250000) q[7];
cx q[11],q[14];
rz(pi*-0.250000) q[21];
cx q[8],q[7];
rz(pi*-0.250000) q[14];
cx q[19],q[21];
cx q[7],q[10];
cx q[12],q[14];
rz(pi*0.250000) q[21];
rz(pi*0.250000) q[10];
rz(pi*0.250000) q[14];
cx q[18],q[21];
h q[10];
cx q[11],q[14];
rz(pi*-0.250000) q[21];
cx q[19],q[18];
rz(pi*-0.250000) q[14];
cx q[12],q[11];
h q[21];
cx q[15],q[19];
rz(pi*0.250000) q[18];
h q[14];
rz(pi*0.250000) q[11];
cx q[9],q[12];
cx q[19],q[21];
h q[15];
cx q[12],q[14];
cx q[19],q[18];
cx q[12],q[11];
cx q[14],q[13];
x q[11];
h q[14];
cx q[12],q[14];
rz(pi*-0.250000) q[14];
cx q[11],q[14];
rz(pi*0.250000) q[14];
rz(pi*0.250000) q[11];
cx q[12],q[14];
rz(pi*-0.250000) q[14];
rz(pi*0.250000) q[12];
cx q[11],q[14];
rz(pi*0.250000) q[14];
cx q[12],q[11];
h q[14];
rz(pi*-0.250000) q[11];
cx q[14],q[16];
rz(pi*0.250000) q[16];
cx q[13],q[16];
rz(pi*-0.250000) q[16];
cx q[14],q[16];
rz(pi*0.250000) q[16];
cx q[13],q[14];
rz(pi*0.250000) q[14];
cx q[13],q[16];
rz(pi*-0.250000) q[16];
cx q[13],q[14];
rz(pi*-0.250000) q[14];
cx q[11],q[14];
rz(pi*0.250000) q[14];
cx q[14],q[16];
rz(pi*-0.250000) q[16];
cx q[13],q[16];
rz(pi*0.250000) q[16];
cx q[14],q[16];
rz(pi*-0.250000) q[16];
cx q[13],q[16];
rz(pi*0.250000) q[16];
cx q[13],q[14];
h q[16];
rz(pi*-0.250000) q[14];
cx q[16],q[15];
cx q[13],q[14];
rz(pi*-0.250000) q[15];
cx q[9],q[15];
rz(pi*0.250000) q[15];
rz(pi*0.250000) q[9];
cx q[16],q[15];
rz(pi*-0.250000) q[15];
cx q[9],q[16];
rz(pi*-0.250000) q[16];
cx q[9],q[15];
rz(pi*0.250000) q[15];
cx q[9],q[16];
rz(pi*0.250000) q[16];
h q[9];
h q[16];
cx q[10],q[9];
cx q[14],q[16];
rz(pi*-0.250000) q[9];
rz(pi*0.250000) q[16];
cx q[4],q[9];
cx q[13],q[16];
rz(pi*0.250000) q[9];
rz(pi*0.250000) q[4];
rz(pi*-0.250000) q[16];
cx q[10],q[9];
cx q[14],q[16];
rz(pi*-0.250000) q[9];
cx q[4],q[10];
rz(pi*0.250000) q[16];
rz(pi*-0.250000) q[10];
cx q[4],q[9];
cx q[13],q[16];
rz(pi*0.250000) q[9];
cx q[4],q[10];
cx q[13],q[14];
rz(pi*-0.250000) q[16];
rz(pi*0.250000) q[10];
h q[4];
rz(pi*0.250000) q[14];
h q[10];
cx q[3],q[4];
cx q[13],q[14];
cx q[8],q[10];
rz(pi*-0.250000) q[4];
rz(pi*-0.250000) q[14];
rz(pi*0.250000) q[10];
cx q[2],q[4];
cx q[11],q[14];
cx q[7],q[10];
rz(pi*0.250000) q[4];
cx q[12],q[11];
cx q[14],q[16];
rz(pi*-0.250000) q[10];
cx q[3],q[4];
rz(pi*-0.250000) q[16];
cx q[8],q[10];
rz(pi*-0.250000) q[4];
cx q[13],q[16];
rz(pi*0.250000) q[10];
cx q[2],q[4];
rz(pi*0.250000) q[16];
cx q[7],q[10];
cx q[2],q[3];
cx q[14],q[16];
rz(pi*-0.250000) q[10];
cx q[7],q[8];
rz(pi*-0.250000) q[3];
rz(pi*-0.250000) q[16];
cx q[14],q[15];
rz(pi*0.250000) q[8];
cx q[2],q[3];
cx q[13],q[16];
rz(pi*0.250000) q[15];
cx q[7],q[8];
rz(pi*0.250000) q[2];
h q[3];
rz(pi*0.250000) q[16];
cx q[14],q[13];
cx q[5],q[8];
cx q[1],q[3];
h q[16];
rz(pi*-0.250000) q[13];
cx q[6],q[5];
cx q[8],q[10];
rz(pi*0.250000) q[3];
cx q[14],q[13];
rz(pi*-0.250000) q[10];
cx q[0],q[3];
cx q[13],q[15];
cx q[7],q[10];
rz(pi*-0.250000) q[3];
rz(pi*-0.250000) q[15];
rz(pi*0.250000) q[10];
cx q[1],q[3];
cx q[14],q[15];
cx q[8],q[10];
rz(pi*0.250000) q[3];
rz(pi*0.250000) q[15];
rz(pi*-0.250000) q[10];
rz(pi*0.250000) q[8];
cx q[0],q[3];
cx q[13],q[15];
cx q[7],q[10];
rz(pi*-0.250000) q[3];
rz(pi*-0.250000) q[0];
rz(pi*-0.250000) q[15];
rz(pi*-0.250000) q[13];
rz(pi*0.250000) q[10];
cx q[7],q[8];
cx q[4],q[3];
cx q[1],q[0];
h q[15];
cx q[13],q[14];
h q[10];
rz(pi*-0.250000) q[8];
h q[3];
rz(pi*0.250000) q[4];
rz(pi*0.250000) q[0];
rz(pi*0.250000) q[14];
cx q[7],q[8];
cx q[3],q[2];
h q[4];
cx q[1],q[0];
cx q[13],q[14];
cx q[8],q[9];
x q[2];
rz(pi*-0.250000) q[1];
x q[0];
h q[14];
rz(pi*0.250000) q[9];
cx q[12],q[14];
cx q[7],q[9];
rz(pi*0.250000) q[14];
rz(pi*-0.250000) q[9];
cx q[11],q[14];
cx q[8],q[9];
rz(pi*-0.250000) q[14];
rz(pi*0.250000) q[9];
cx q[7],q[8];
cx q[12],q[14];
rz(pi*0.250000) q[8];
cx q[7],q[9];
rz(pi*0.250000) q[14];
rz(pi*-0.250000) q[12];
rz(pi*-0.250000) q[9];
cx q[7],q[8];
cx q[11],q[14];
h q[9];
rz(pi*-0.250000) q[8];
rz(pi*-0.250000) q[14];
cx q[11],q[12];
h q[8];
h q[14];
rz(pi*0.250000) q[12];
cx q[6],q[8];
cx q[14],q[15];
cx q[11],q[12];
rz(pi*0.250000) q[8];
cx q[14],q[13];
rz(pi*-0.250000) q[11];
cx q[5],q[8];
x q[13];
x q[11];
rz(pi*-0.250000) q[8];
cx q[6],q[8];
rz(pi*0.250000) q[8];
cx q[5],q[8];
cx q[5],q[6];
rz(pi*-0.250000) q[8];
rz(pi*0.250000) q[6];
h q[8];
cx q[5],q[6];
cx q[8],q[9];
rz(pi*-0.250000) q[5];
rz(pi*-0.250000) q[6];
cx q[8],q[7];
x q[5];
x q[7];
