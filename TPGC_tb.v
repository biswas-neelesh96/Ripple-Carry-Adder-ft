`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2025 10:46:07
// Design Name: 
// Module Name: TPGC_tb
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


`timescale 1ns / 1ps

module TPGC_tb;

  // Inputs
  reg init;
  reg clk;

  // Outputs
  wire [4:0] a, b;
  wire c_1;

  // Instantiate the Unit Under Test (UUT)
  TPGC uut (init,clk,a,b,c_1);

  // Clock generation
always #5 clk = ~clk;

initial begin
    
    
    clk = 0;
    init = 1; #10;
    init = 0; #100;

    $finish;
end


endmodule
