`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:14 12/11/2014 
// Design Name: 
// Module Name:    time 
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
module timer(
	 input clk,
	 input rst,
    input kbClk,
    input kbData,
    input [10:0] x,
    input [9:0] y,
    output [5:0] color
    );

reg [5:0] color_out;
wire [5:0] color_d1;
wire [5:0] color_d2;
wire [5:0] color_d3;
wire [5:0] color_d4;
wire [5:0] color_dot;
wire [3:0] d1;
wire [3:0] d2;
wire [3:0] d3;
wire [3:0] d4;
wire de;

clock cl(.clk(clk),.rst(rst), .kbClk(kbClk), .kbData(kbData),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.de(de));

digit d1m(.clk(clk),.rst(rst),.x(x),.y(y),.color(color_d1),.baseX(50),.d(d4));
digit d2m(.clk(clk),.rst(rst),.x(x),.y(y),.color(color_d2),.baseX(220),.d(d3));
digit d3m(.clk(clk),.rst(rst),.x(x),.y(y),.color(color_d3),.baseX(430),.d(d2));
digit d4m(.clk(clk),.rst(rst),.x(x),.y(y),.color(color_d4),.baseX(600),.d(d1));
dot d(.clk(clk),.rst(rst),.x(x),.y(y),.color(color_dot),.en(de));

always @(posedge clk)
begin
	if(x>=50 & x<200)
		color_out<=color_d1;
	else if(x>=220 & x<370)
		color_out<=color_d2;
	else if(x>=370 & x<430)
		color_out<=color_dot;
	else if(x>=430 & x<580)
		color_out<=color_d3;
	else if(x>=600 & x<750)
		color_out<=color_d4;
	else
		color_out<=6'b0;
end

assign color=color_out;

endmodule
