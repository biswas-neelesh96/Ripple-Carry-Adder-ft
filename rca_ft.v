`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 09:17:32
// Design Name: 
// Module Name: rca_ft
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rca_ft(input [3:0]a,b,
              input TC_1,
              input test,
              input IS0,IS1,IS2,
              input CS0,CS1,CS2,CS3,CS4,
              input SS0,SS1,SS2,SS3,
              input [4:0]TA,TB,
              output [4:0]s,
              output [3:0]st,ct);
wire c_1,a0,b0;
wire a11,b11,a12,b12,a13,b13;
wire A0,A1,A2,A3,A4,B0,B1,B2,B3,B4;

wire [3:0]sout;
wire cout;
//assign TA={a[3],a};
//assign TB={b[3],b};
mux2to1 t0 (0,TC_1,test,c_1);
mux2to1 t1 (a[0],TA[0],test,A0);
mux2to1 t2 (b[0],TB[0],test,B0);

mux2to1 m0 (a[1],a[0],IS0,a11);
mux2to1 m1 (b[1],b[0],IS0,b11);

mux2to1 m2 (a[2],a[1],IS1,a12);
mux2to1 m3 (b[2],b[1],IS1,b12);

mux2to1 m4 (a[3],a[2],IS2,a13);
mux2to1 m5 (b[3],b[2],IS2,b13);

mux2to1 t3 (a11,TA[1],test,A1);
mux2to1 t4 (b11,TB[1],test,B1);

mux2to1 t5 (a12,TA[2],test,A2);
mux2to1 t6 (b12,TB[2],test,B2);

mux2to1 t7 (a13,TA[3],test,A3);
mux2to1 t8 (b13,TB[3],test,B3);

mux2to1 t9 (a[3],TA[4],test,A4);
mux2to1 t10 (b[3],TB[4],test,B4);

fa f00 (A0,B0,c_1,S10,C10);
mux2to1 f01 (C10,c_1,CS0,C0);

fa f10 (A1,B1,C0,S11,C11);
mux2to1 f11 (C11,C10,CS1,C1);
fa f20 (A2,B2,C1,S12,C12);
mux2to1 f21 (C12,C11,CS2,C2);

fa f30 (A3,B3,C2,S13,C13);
mux2to1 f31 (C13,C12,CS3,C3);

fa f40 (A4,B4,C3,S14,C14);
mux2to1 f41 (C13,C14,CS4,cout);

mux2to1 s1 (S10,S11,SS0,sout[0]);
mux2to1 s2 (S11,S12,SS1,sout[1]);
mux2to1 s3 (S12,S13,SS2,sout[2]);
mux2to1 s4 (S13,S14,SS3,sout[3]);

assign s={cout,sout};
assign st={S13,S12,S11,S10};
assign ct={C13,C12,C11,C10};
endmodule
   