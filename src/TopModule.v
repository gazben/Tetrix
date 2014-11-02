`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SmileWakers Inc.
// Engineer: Gazben
//
// Module Name:    RenderModule 
// Project Name:   Tetrix
//////////////////////////////////////////////////////////////////////////////////

module TopModule(
    input clk50M,
    //input rst,
  
    output [7:0] aio
  );

  RenderModule(
    .clk( clk50M ),
    .VGA_out( aio )
  );
 

endmodule
