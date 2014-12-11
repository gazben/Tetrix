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
    output cpld_clk,
    output cpld_rstn,
    output cpld_load,
    output cpld_mosi,
    output [12:5] aio_out,
    input [14:13] aio_in
  );
  wire [7:0] led_wire;

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
  RenderModule renderer(
    .clk( clk_in ),
    .rst( rst ),
    .kbClk( aio_in[13] ),
    .kbData( aio_in[14] ),
    
    .VGA_out( aio_out )
  );
  
  
  /*
    input clk,
    input rst,
    input [7:0] led,
    input [3:0] dig0,
    input [3:0] dig1,
    output cpld_clk,
    output cpld_rstn,
    output cpld_ld,
    output cpld_mosi
  */  
  /*
  NET cpld_rstn      LOC=P74; # | IOSTANDARD=LVCMOS33;
  NET cpld_clk       LOC=P78; # | IOSTANDARD=LVCMOS33;
  NET cpld_load      LOC=P80;# | IOSTANDARD=LVCMOS33;
  NET cpld_mosi      LOC=P81; # | IOSTANDARD=LVCMOS33;
  */
  led_out(
   .clk( clk_in ),
   .rst( rst ),
   .dig0( led_wire[3:0] ),
   .dig1( led_wire[7:4] ),
   .led( led_wire ),
   .cpld_rstn( cpld_rstn ),  
   .cpld_clk( cpld_clk ),      
   .cpld_ld( cpld_load ),    
   .cpld_mosi( cpld_mosi )      
  );
  
  
  /*
  input clk,               // Clock pin form keyboard
  input clk_keyboard,
  input rst,
  input data,              //Data pin form keyboard
  output [7:0] keyCodeOut   //Printing input data to led
  */
  keyboard_interface keyboard_module(
     .clk( clk_in ),
     .clkKeyboard( aio_in[13] ),
     .rst( rst ),
     .data( aio_in[14] ),
     .keyCodeOut( led_wire )
  );

endmodule
