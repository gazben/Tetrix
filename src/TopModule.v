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
    input rst,
    output [12:5] aio
  );

  RenderModule renderer(
    //.Pixel_Bus( 8'b00000000 ),
    //.Pixel_Bus_Enable( 1'b0 ),
    .clk( clk_in ),
    .rst( rst ),
    
    .VGA_out( aio )
  );
 /*
   input[7:0]    Pixel_Bus,
  input         Pixel_Bus_Enable,
  input         clk,
  input         rst,
  
  output [7:0]  VGA_out,
  output [9:0]  PixelCord_x, 
  output [9:0]  PixelCord_y,
  output        InViewableArea
 
 
 */

endmodule
