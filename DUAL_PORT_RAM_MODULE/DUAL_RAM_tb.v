`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 18:04:01
// Design Name: 
// Module Name: DUAL_RAM_tb
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



module DUAL_RAM_tb;

    // Inputs
    reg [31:0] D_IN_A, D_IN_B;
    reg clk;
    reg WE_A, WE_B;
    reg [2:0] ADDR_A, ADDR_B;

    // Outputs
    wire [31:0] Q_OUT_A, Q_OUT_B;

    // Instantiate the DUT
    DUAL_PORT_RAM uut (
        .D_IN_A(D_IN_A),
        .D_IN_B(D_IN_B),
        .clk(clk),
        .WE_A(WE_A),
        .WE_B(WE_B),
        .ADDR_A(ADDR_A),
        .ADDR_B(ADDR_B),
        .Q_OUT_A(Q_OUT_A),
        .Q_OUT_B(Q_OUT_B)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10 ns clock period

    // Initial block
    initial begin
        // Initialize inputs
        D_IN_A = 0;
        D_IN_B = 0;
        ADDR_A = 0;
        ADDR_B = 0;
        WE_A = 0;
        WE_B = 0;

        // Start test
        #12; // Wait to align with posedge

        ADDR_A = 3'd0;
        ADDR_B = 3'd4;
        D_IN_A = 32'h15;
        D_IN_B = 32'h19;
        WE_A = 1;
        WE_B = 1;

        #10; 
        
        ADDR_A = 3'd1;
        ADDR_B = 3'd5;
        D_IN_A = 32'h16;
        D_IN_B = 32'h20;
        WE_A = 1;
        WE_B = 1;
       
        #10;

        ADDR_A = 3'd2;
        ADDR_B = 3'd6;
        D_IN_A = 32'h17;
        D_IN_B = 32'h21;
        WE_A = 1;
        WE_B = 1;

        #10;
        
        ADDR_A = 3'd3;
        ADDR_B = 3'd7;
        D_IN_A = 32'h18;
        D_IN_B = 32'h22;
        WE_A = 1;
        WE_B = 1;
        
        #10;
        
        ADDR_A = 3'd0;
        ADDR_B = 3'd4;
        WE_A=0;
        WE_B=0;
        
        #10
        
        ADDR_A = 3'd1;
        ADDR_B = 3'd5;
        WE_A=0;
        WE_B=0;
        
        #10
        
        ADDR_A = 3'd2;
        ADDR_B = 3'd6;
        WE_A=0;
        WE_B=0;
        
        #10
        
        ADDR_A = 3'd3;
        ADDR_B = 3'd7;
        WE_A=0;
        WE_B=0;
        
        #10
        
        ADDR_A = 3'd3;
        ADDR_B = 3'd7;
        D_IN_A = 32'h10;
        D_IN_B = 32'h11;
        WE_A=0;
        WE_B=0;
        
        #10

        $finish;
    end

endmodule


