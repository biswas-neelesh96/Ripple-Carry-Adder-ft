`timescale 1ns / 1ps

module rca_ft_tb();
    
    // Inputs
    reg [3:0] a, b;
    reg c1, test;
    reg IS0,IS1,IS2;
    reg CS0, CS1, CS2, CS3, CS4;
    reg SS0, SS1, SS2, SS3;
    reg [4:0] TA, TB;
    
    // Outputs
    wire [4:0] s;
    wire [3:0]st,ct;
    //wire cout;
    
    // Instantiate the module under test
    rca_ft uut (a,b,c1,test,IS0,IS1,IS2,CS0,CS1,CS2,CS3,CS4,SS0,SS1,SS2,SS3,TA,TB,s,st,ct);
    
    initial begin
        // Test case 1: Basic addition
        test = 1'b0;
        IS0 = 0; IS1 = 0; IS2 = 0;
        CS0 = 0; CS1 = 0; CS2 = 0; CS3 = 0; CS4 = 0;
        SS0 = 0; SS1 = 0; SS2 = 0; SS3 = 0;
        
        a = 4'b0001; b = 4'b0010; c1 = 1'b0; 
        TA = 5'b00001; TB = 5'b00010;
        #40;
        
        a = 4'b0001; b = 4'b0011; c1 = 1'b0;
        TA = 5'b00001; TB = 5'b00011;
        #40;
        
        a = 4'b1001; b = 4'b0011; c1 = 1'b0; 
        TA = 5'b01001; TB = 5'b00011;
        #40
        
        a = 4'b1001; b = 4'b1011; c1 = 1'b0;
        TA = 5'b01001; TB = 5'b01011;
        #40
        
        a = 4'b1100; b = 4'b1011; c1 = 1'b0;
        TA = 5'b01100; TB = 5'b01011;
        #40
        
        a = 4'b1100; b = 4'b0111; c1 = 1'b0;
        TA = 5'b01100; TB = 5'b00111;
        #40
        
        a = 4'b1000; b = 4'b0111; c1 = 1'b0; 
        TA = 5'b01000; TB = 5'b00111;
        #40
        
        a = 4'b1000; b = 4'b0110; c1 = 1'b0; 
        TA = 5'b01000; TB = 5'b00110;
        #40
        
                
        a = 4'b0001; b = 4'b0110; c1 = 1'b0; 
        TA = 5'b00001; TB = 5'b00110;
        #40
        
        a = 4'b0001; b = 4'b1110; c1 = 1'b0; 
        TA = 5'b00001; TB = 5'b01110;
        #40
        // End simulation
        $stop;
    end
    
endmodule
