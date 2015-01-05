`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:14:28 01/04/2015
// Design Name:   dec
// Module Name:   C:/Users/netpok/Desktop/Tetrix/tb_decoder.v
// Project Name:  Tetrix
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_decoder;

	// Inputs
	reg [3:0] dec;

	// Outputs
	wire [6:0] seg;

	// Instantiate the Unit Under Test (UUT)
	dec uut (
		.dec(dec), 
		.seg(seg)
	);

	initial begin
		// Initialize Inputs
		dec = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always
		#5 dec <= (dec==9)?0:dec + 1;
      
endmodule

