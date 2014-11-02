`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:06 11/02/2014 
// Design Name: 
// Module Name:    color 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module color(
	 input clk,
	 input rst,
    input [10:0] x,
    input [9:0] y,
    output [5:0] color
    );
	
	reg [2:0] color1;
	reg [2:0] color2;

	always @(posedge clk)
	begin
		if(x<100 | x==1039)
			color1<=3'b000;
		else if(x<199)
			color1<=3'b001;
		else if(x<299)
			color1<=3'b010;
		else if(x<399)
			color1<=3'b100;
		else if(x<499)
			color1<=3'b011;
		else if(x<599)
			color1<=3'b101;
		else if(x<699)
			color1<=3'b110;
		else
			color1<=3'b111;
	end
	
	always @(posedge clk)
	begin
		if(y<74 | y==665)
			color2<=3'b000;
		else if(y<149)
			color2<=3'b001;
		else if(y<224)
			color2<=3'b010;
		else if(y<299)
			color2<=3'b100;
		else if(y<374)
			color2<=3'b011;
		else if(y<449)
			color2<=3'b101;
		else if(y<524)
			color2<=3'b110;
		else
			color2<=3'b111;
	end
	
	assign color={color2[2], color1[2], color2[1], color1[1], color2[0], color1[0]};

endmodule
