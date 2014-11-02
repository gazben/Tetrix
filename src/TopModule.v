`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SmileWakers Inc.
// Engineer: Gazben
//
// Module Name:    RenderModule 
// Project Name:   Tetrix
//////////////////////////////////////////////////////////////////////////////////

module TopModule(
    input clk_in,  
    output [12:5] aio
  );

  RenderModule renderer(
    .clk( clk_in ),
    .VGA_out( aio )
  );
 

endmodule
