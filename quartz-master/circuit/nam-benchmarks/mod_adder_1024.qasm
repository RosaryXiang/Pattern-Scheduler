OPENQASM 2.0;
include "qelib1.inc";
qreg qubits[28];
cx qubits[9],qubits[19];
h qubits[19];
ccz qubits[8],qubits[18],qubits[19];
h qubits[19];
cx qubits[8],qubits[18];
h qubits[20];
ccz qubits[7],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[7],qubits[17],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[7],qubits[17],qubits[18];
h qubits[18];
cx qubits[7],qubits[17];
h qubits[21];
ccz qubits[6],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[6],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[6],qubits[16],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[20],qubits[17],qubits[18];
h qubits[18];
h qubits[20];
ccz qubits[6],qubits[16],qubits[20];
h qubits[20];
h qubits[17];
ccz qubits[6],qubits[16],qubits[17];
h qubits[17];
cx qubits[6],qubits[16];
h qubits[22];
ccz qubits[5],qubits[15],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[5],qubits[15],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[5],qubits[15],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[20],qubits[17],qubits[18];
h qubits[18];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[5],qubits[15],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[5],qubits[15],qubits[20];
h qubits[20];
h qubits[17];
ccz qubits[20],qubits[16],qubits[17];
h qubits[17];
h qubits[20];
ccz qubits[5],qubits[15],qubits[20];
h qubits[20];
h qubits[16];
ccz qubits[5],qubits[15],qubits[16];
h qubits[16];
cx qubits[5],qubits[15];
h qubits[23];
ccz qubits[4],qubits[14],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[4],qubits[14],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[4],qubits[14],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[20],qubits[17],qubits[18];
h qubits[18];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[4],qubits[14],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[4],qubits[14],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[17];
ccz qubits[20],qubits[16],qubits[17];
h qubits[17];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[4],qubits[14],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[4],qubits[14],qubits[20];
h qubits[20];
h qubits[16];
ccz qubits[20],qubits[15],qubits[16];
h qubits[16];
h qubits[20];
ccz qubits[4],qubits[14],qubits[20];
h qubits[20];
h qubits[15];
ccz qubits[4],qubits[14],qubits[15];
h qubits[15];
cx qubits[4],qubits[14];
h qubits[24];
ccz qubits[3],qubits[13],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[3],qubits[13],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[3],qubits[13],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[20],qubits[17],qubits[18];
h qubits[18];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[3],qubits[13],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[3],qubits[13],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[17];
ccz qubits[20],qubits[16],qubits[17];
h qubits[17];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[3],qubits[13],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[3],qubits[13],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[16];
ccz qubits[20],qubits[15],qubits[16];
h qubits[16];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[3],qubits[13],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[3],qubits[13],qubits[20];
h qubits[20];
h qubits[15];
ccz qubits[20],qubits[14],qubits[15];
h qubits[15];
h qubits[20];
ccz qubits[3],qubits[13],qubits[20];
h qubits[20];
h qubits[14];
ccz qubits[3],qubits[13],qubits[14];
h qubits[14];
cx qubits[3],qubits[13];
h qubits[25];
ccz qubits[2],qubits[12],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[25],qubits[13],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[25],qubits[13],qubits[24];
h qubits[24];
h qubits[25];
ccz qubits[2],qubits[12],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[2],qubits[12],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[13],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[20],qubits[17],qubits[18];
h qubits[18];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[13],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[2],qubits[12],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[2],qubits[12],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[13],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[17];
ccz qubits[20],qubits[16],qubits[17];
h qubits[17];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[13],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[2],qubits[12],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[2],qubits[12],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[13],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[16];
ccz qubits[20],qubits[15],qubits[16];
h qubits[16];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[13],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[2],qubits[12],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[2],qubits[12],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[13],qubits[20];
h qubits[20];
h qubits[15];
ccz qubits[20],qubits[14],qubits[15];
h qubits[15];
h qubits[20];
ccz qubits[21],qubits[13],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[2],qubits[12],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[2],qubits[12],qubits[20];
h qubits[20];
h qubits[14];
ccz qubits[20],qubits[13],qubits[14];
h qubits[14];
h qubits[20];
ccz qubits[2],qubits[12],qubits[20];
h qubits[20];
h qubits[13];
ccz qubits[2],qubits[12],qubits[13];
h qubits[13];
cx qubits[2],qubits[12];
h qubits[26];
ccz qubits[1],qubits[11],qubits[26];
h qubits[26];
h qubits[25];
ccz qubits[26],qubits[12],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[25],qubits[13],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[25],qubits[13],qubits[24];
h qubits[24];
h qubits[25];
ccz qubits[26],qubits[12],qubits[25];
h qubits[25];
h qubits[26];
ccz qubits[1],qubits[11],qubits[26];
h qubits[26];
h qubits[25];
ccz qubits[1],qubits[11],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[25],qubits[12],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[13],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[20],qubits[17],qubits[18];
h qubits[18];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[13],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[25],qubits[12],qubits[24];
h qubits[24];
h qubits[25];
ccz qubits[1],qubits[11],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[1],qubits[11],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[12],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[13],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[17];
ccz qubits[20],qubits[16],qubits[17];
h qubits[17];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[13],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[12],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[1],qubits[11],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[1],qubits[11],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[12],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[13],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[16];
ccz qubits[20],qubits[15],qubits[16];
h qubits[16];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[13],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[12],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[1],qubits[11],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[1],qubits[11],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[12],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[13],qubits[20];
h qubits[20];
h qubits[15];
ccz qubits[20],qubits[14],qubits[15];
h qubits[15];
h qubits[20];
ccz qubits[21],qubits[13],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[12],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[1],qubits[11],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[1],qubits[11],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[12],qubits[20];
h qubits[20];
h qubits[14];
ccz qubits[20],qubits[13],qubits[14];
h qubits[14];
h qubits[20];
ccz qubits[21],qubits[12],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[1],qubits[11],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[1],qubits[11],qubits[20];
h qubits[20];
h qubits[13];
ccz qubits[20],qubits[12],qubits[13];
h qubits[13];
h qubits[20];
ccz qubits[1],qubits[11],qubits[20];
h qubits[20];
h qubits[12];
ccz qubits[1],qubits[11],qubits[12];
h qubits[12];
cx qubits[1],qubits[11];
h qubits[27];
ccz qubits[0],qubits[10],qubits[27];
h qubits[27];
h qubits[26];
ccz qubits[27],qubits[11],qubits[26];
h qubits[26];
h qubits[25];
ccz qubits[26],qubits[12],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[25],qubits[13],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[19];
ccz qubits[20],qubits[18],qubits[19];
h qubits[19];
h qubits[20];
ccz qubits[21],qubits[17],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[16],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[15],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[14],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[25],qubits[13],qubits[24];
h qubits[24];
h qubits[25];
ccz qubits[26],qubits[12],qubits[25];
h qubits[25];
h qubits[26];
ccz qubits[27],qubits[11],qubits[26];
h qubits[26];
h qubits[27];
ccz qubits[0],qubits[10],qubits[27];
h qubits[27];
h qubits[26];
ccz qubits[0],qubits[10],qubits[26];
h qubits[26];
h qubits[25];
ccz qubits[26],qubits[11],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[25],qubits[12],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[13],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[18];
ccz qubits[20],qubits[17],qubits[18];
h qubits[18];
h qubits[20];
ccz qubits[21],qubits[16],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[15],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[14],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[13],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[25],qubits[12],qubits[24];
h qubits[24];
h qubits[25];
ccz qubits[26],qubits[11],qubits[25];
h qubits[25];
h qubits[26];
ccz qubits[0],qubits[10],qubits[26];
h qubits[26];
h qubits[25];
ccz qubits[0],qubits[10],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[25],qubits[11],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[12],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[13],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[17];
ccz qubits[20],qubits[16],qubits[17];
h qubits[17];
h qubits[20];
ccz qubits[21],qubits[15],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[14],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[13],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[12],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[25],qubits[11],qubits[24];
h qubits[24];
h qubits[25];
ccz qubits[0],qubits[10],qubits[25];
h qubits[25];
h qubits[24];
ccz qubits[0],qubits[10],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[24],qubits[11],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[12],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[13],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[16];
ccz qubits[20],qubits[15],qubits[16];
h qubits[16];
h qubits[20];
ccz qubits[21],qubits[14],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[13],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[12],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[24],qubits[11],qubits[23];
h qubits[23];
h qubits[24];
ccz qubits[0],qubits[10],qubits[24];
h qubits[24];
h qubits[23];
ccz qubits[0],qubits[10],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[23],qubits[11],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[12],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[13],qubits[20];
h qubits[20];
h qubits[15];
ccz qubits[20],qubits[14],qubits[15];
h qubits[15];
h qubits[20];
ccz qubits[21],qubits[13],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[12],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[23],qubits[11],qubits[22];
h qubits[22];
h qubits[23];
ccz qubits[0],qubits[10],qubits[23];
h qubits[23];
h qubits[22];
ccz qubits[0],qubits[10],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[22],qubits[11],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[12],qubits[20];
h qubits[20];
h qubits[14];
ccz qubits[20],qubits[13],qubits[14];
h qubits[14];
h qubits[20];
ccz qubits[21],qubits[12],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[22],qubits[11],qubits[21];
h qubits[21];
h qubits[22];
ccz qubits[0],qubits[10],qubits[22];
h qubits[22];
h qubits[21];
ccz qubits[0],qubits[10],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[21],qubits[11],qubits[20];
h qubits[20];
h qubits[13];
ccz qubits[20],qubits[12],qubits[13];
h qubits[13];
h qubits[20];
ccz qubits[21],qubits[11],qubits[20];
h qubits[20];
h qubits[21];
ccz qubits[0],qubits[10],qubits[21];
h qubits[21];
h qubits[20];
ccz qubits[0],qubits[10],qubits[20];
h qubits[20];
h qubits[12];
ccz qubits[20],qubits[11],qubits[12];
h qubits[12];
h qubits[20];
ccz qubits[0],qubits[10],qubits[20];
h qubits[20];
h qubits[11];
ccz qubits[0],qubits[10],qubits[11];
h qubits[11];
cx qubits[0],qubits[10];
