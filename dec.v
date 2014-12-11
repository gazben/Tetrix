`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:14 12/11/2014 
// Design Name: 
// Module Name:    dec 
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
module dec(
    input [3:0] dec,
    output [6:0] seg
    );

assign seg={(dec==0 | dec==4 | dec==5 | dec==6 | dec==8 | dec==9),
	(dec==0 | dec==2 | dec==6 | dec==8),
	(dec==0 | dec==2 | dec==3 | dec==5 | dec==6 | dec==7 | dec==8 | dec==9),
	(dec==2 | dec==3 | dec==4 | dec==5 | dec==6 | dec==8 | dec==9),
	(dec==0 | dec==2 | dec==3 | dec==5 | dec==6 | dec==8 | dec==9),
	(dec==0 | dec==1 | dec==2 | dec==3 | dec==4 | dec==7 | dec==8 | dec==9),
	(dec==0 | dec==1 | dec==3 | dec==4 | dec==5 | dec==6 | dec==7 | dec==8 | dec==9)};

endmodule
