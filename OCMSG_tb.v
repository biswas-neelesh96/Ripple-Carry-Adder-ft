`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2025 10:30:46
// Design Name: 
// Module Name: OCMSG_tb
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

module OCMSG_tb;
    
    // Inputs
    reg clk;
    reg clr;
    reg [3:0] sf, cf;
    reg [2:0] lut_i;
   wire IS0, IS1, IS2;
    wire CS0, CS1, CS2, CS3, CS4;
   wire SS0, SS1, SS2, SS3;
    
    // Instantiate the Unit Under Test (UUT)
    //OCMSG uut (clk,clr,sf,cf,lut_i,cx,sx,lut_o,r0,r1);
   //OCMSG uut (clk,clr,sf,cf,lut_i,IS0,IS1,IS2,CS0,CS1,CS2,CS3,CS4,SS0,SS1,SS2,SS3);
     //OCMSG uut (clk,clr,sf,cf,lut_i,lut_o,IS0,IS1,IS2,CS0,CS1,CS2,CS3,CS4,SS0,SS1,SS2,SS3);
    OCMSG uut (clk,clr,sf,cf,lut_i,IS0,IS1,IS2,CS0,CS1,CS2,CS3,CS4,SS0,SS1,SS2,SS3);
    // Clock Generation
    always #5 clk = ~clk; // 10ns period 
    always #10 lut_i=lut_i+1;
    
    // Test Procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        clr = 1;
        sf = 4'b0000;
        cf = 4'b0000;
        lut_i = 3'b000;
        
        // Wait for reset
        #10 clr = 0;
        
        // Apply test cases
      
       
        sf = 4'b1111; cf = 4'b0000; 
        #20 sf = 4'b0101; cf = 4'b1010;
        //#10 sf = 4'b0101; cf = 4'b0101;
        // Additional test cases
        #10 sf = 4'b1010; cf = 4'b0101; 
        #10 sf = 4'b0000; cf = 4'b1111;
        #20 sf = 4'b1111; cf = 4'b1111;
        #10
        // Finish simulation
        $stop;
    end
    
    // Monitor Outputs
  //  initial begin
   //     $monitor("Time=%0t | sf=%b cf=%b lut_i=%b | IS=%b%b%b%b%b%b | CS=%b%b%b%b%b | SS=%b%b%b%b", 
   //              $time, sf, cf, lut_i, IS5, IS4, IS3, IS2, IS1, IS0, CS4, CS3, CS2, CS1, CS0, SS3, SS2, SS1, SS0);
  //  end
    
endmodule
