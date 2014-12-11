`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:48 12/11/2014 
// Design Name: 
// Module Name:    dot
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
module dot(
    input clk,
    input rst,
	 input [10:0] x,
    input [9:0] y,
	 input en,
    output [5:0] color
    );

reg [5:0] color_out;

always @(posedge clk)
begin
	if(en & x>=385 & x<415 & ((y>=255 & y<285) | (y>=315 & y<345)))
		color_out<=6'b100111;
	else
		color_out<=6'b0;
end

assign color=color_out;

endmodule
