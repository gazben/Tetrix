`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:41 11/02/2014
// Design Name:   TopModule
// Module Name:   F:/Prog_Projectek/Tetrix/Tetrix_test.v
// Project Name:  Tetrix
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Tetrix_test;

	// Inputs
	reg clk;

	// Outputs
	wire [12:5] aio;

	// Instantiate the Unit Under Test (UUT)
	TopModule uut (
		.clk_in(clk), 
		.aio(aio)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

always #5 clk <= ~clk;  
  
endmodule

