`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 15:09:25
// Design Name: 
// Module Name: TPGC
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


module TPGC(input init, clk, output reg[4:0]a,b, output [2:0]d,output c_1); 
counter3bit c0 (clk,init,d);
assign c_1= d[0];

always @(*) begin
        a[0] = d[2];
        a[1] = (((~d[1])&(d[2]|d[0]))|(d[2]&d[0]));
        a[2] = d[1];
        a[3] = a[1];
        a[4] = a[2];

        b[0] = d[1];
        b[1] = (((~d[0])&(d[2]|d[1]))|(d[2]&d[1]));
        b[2] = d[0];
        b[3] = b[1];
        b[4] = b[2];
    end
endmodule
