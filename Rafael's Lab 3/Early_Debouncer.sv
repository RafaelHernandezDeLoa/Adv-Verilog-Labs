`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 09:39:34 PM
// Design Name: 
// Module Name: Early_Debouncer
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


module Early_Debouncer_tb(

    );
    
    // signal declaration
    localparam T = 10;
    
    logic sw, reset, clk;
    logic db;
    
    // instantiate unit under test (uut)
    
    Early_Debouncer uut0(.*);
    
    // test vector
    
    // clock generator
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    initial
    begin
        reset = 1'b1;
        #(T/2);
        reset = 1'b0;
    end
    
    // stimuli
    initial
    begin
        sw = 1'b0;
        #9999970;
        sw = 1'b1;
        #20
        sw = 1'b0;
        #20000040;
        sw = 1'b1;
        #40000000;
        sw = 1'b0;
        #50000000;
        $stop;
    end
    
endmodule
