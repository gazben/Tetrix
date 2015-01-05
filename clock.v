`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:49:05 12/11/2014 
// Design Name: 
// Module Name:    clock 
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
module clock(
    input clk,
    input rst,
	 input kbClk,
	 input kbData,
    output [3:0] d1,
    output [3:0] d2,
    output [3:0] d3,
    output [3:0] d4,
    output de
    );

reg [3:0] d1r;
reg [3:0] d2r;
reg [3:0] d3r;
reg [3:0] d4r;

wire ce;
reg [25:0] cnt;
wire [8:0] key;

wire rstr;

keyboard_interface kbInt(.clk(clk), .rst(rst), .clkKeyboard(kbClk), .data(kbData), .keyCodeOut(key));

reg [3:0] dig;

assign rstr=(key==8'h5a | rst);

always @(posedge clk)
begin
	if(ce | rstr)
		cnt<=0;
	else
		cnt<=cnt+1;
end

assign ce=(cnt==49999999);

always @(posedge clk)
begin
	if((d1r==9 & ce) | rstr)
		d1r<=0;
	else if(ce)
		d1r<=d1r+1;
end

always @(posedge clk)
begin
	if((d2r==5 & d1r==9 & ce)| rstr)
		d2r<=0;
	else if(d1r==9 & ce)
		d2r<=d2r+1;
end

always @(posedge clk)
begin
	if((d3r==9 & d2r==5 & d1r==9 & ce) | rstr)
		d3r<=0;
	else if(d2r==5 & d1r==9 & ce)
		d3r<=d3r+1;
end

always @(posedge clk)
begin
	if((d4r==9 & d3r==9 & d2r==5 & d1r==9 & ce)| rstr)
		d4r<=0;
	else if(d3r==9 & d2r==5 & d1r==9 & ce)
		d4r<=d4r+1;
end
	
assign d1=d1r;
assign d2=d2r;
assign d3=d3r;
assign d4=d4r;
assign de=d1r[0];

endmodule
