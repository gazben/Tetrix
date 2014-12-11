`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:48 12/11/2014 
// Design Name: 
// Module Name:    digit 
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
module digit(
    input clk,
    input rst,
    input [9:0] baseX,
	 input [10:0] x,
    input [9:0] y,
    input [3:0] d,
    output [5:0] color
    );

reg [5:0] color_out;
wire [6:0] e;

dec decoder(.seg(e),.dec(d));

always @(posedge clk)
begin
	if(x>=baseX & x<baseX+30 & y>=130 & y<285 & e[6])
		color_out<=6'b100111;
	else if(x>=baseX & x<baseX+30 & y>=315 & y<470 & e[5])
		color_out<=6'b100111;
	else if(x>=baseX+30 & x<baseX+120 & y>=100 & y<130 & e[4])
		color_out<=6'b100111;
	else if(x>=baseX+30 & x<baseX+120 & y>=285 & y<315 & e[3])
		color_out<=6'b100111;
	else if(x>=baseX+30 & x<baseX+120 & y>=470 & y<500 & e[2])
		color_out<=6'b100111;
	else if(x>=baseX+120 & x<baseX+150 & y>=130 & y<285 & e[1])
		color_out<=6'b100111;
	else if(x>=baseX+120 & x<baseX+150 & y>=315 & y<470 & e[0])
		color_out<=6'b100111;
	else
		color_out<=6'b0;
end

assign color=color_out;

endmodule
