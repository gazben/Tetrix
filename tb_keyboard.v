`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:34:57 01/04/2015
// Design Name:   keyboard_interface
// Module Name:   C:/Users/netpok/Desktop/Tetrix/keyboard.v
// Project Name:  Tetrix
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keyboard_interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module keyboard;

	// Inputs
	reg clk;
	reg clkKeyboard;
	reg rst;
	reg data;

	// Outputs
	wire [7:0] keyCodeOut;

	// Instantiate the Unit Under Test (UUT)
	keyboard_interface uut (
		.clk(clk), 
		.clkKeyboard(clkKeyboard), 
		.rst(rst), 
		.data(data), 
		.keyCodeOut(keyCodeOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clkKeyboard = 1;
		rst = 0;
		data = 1;

		// Wait 100 ns for global reset to finish
		#100;
		#5 rst<=1;
		#5 rst<=0;
		#20; //send Q return value 15h
		#20 data<=0;
      #30 clkKeyboard<=0;
      #50 clkKeyboard<=1;
		#20 data<=1;
      #30 clkKeyboard<=0;
      #50 clkKeyboard<=1;
		#20 data<=0;
      #30 clkKeyboard<=0;
      #50 clkKeyboard<=1;
      #20 data<=1;
		#30 clkKeyboard<=0;
      #50 clkKeyboard<=1;
		#20 data<=0;
      #30 clkKeyboard<=0;
      #50 clkKeyboard<=1;
		#20 data<=1;
      #30 clkKeyboard<=0;
		#50 clkKeyboard<=1;
		#20 data<=0;
      #30 clkKeyboard<=0;
      #50 clkKeyboard<=1;
      #50 clkKeyboard<=0;
      #50 clkKeyboard<=1;
      #50 clkKeyboard<=0;
      #50 clkKeyboard<=1;
      #50 clkKeyboard<=0;
      #50 clkKeyboard<=1;
		#20 data<=1;
      #50 clkKeyboard<=0;
      #50 clkKeyboard<=1;
		// Add stimulus here

	end
      
	always
		#5 clk <= ~clk;
		
endmodule

