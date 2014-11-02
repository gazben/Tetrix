`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SmileWakers Inc.
// Engineer: Gazben
//
// Module Name:    RenderModule 
// Project Name:   Tetrix
//////////////////////////////////////////////////////////////////////////////////
module RenderModule(
  input[7:0]    Pixel_Bus,
  input         Pixel_Bus_Enable,
  input         clk,
  input         rst,
  
  output [9:0]  VGA_out,
  output [9:0]  PixelCord_x, 
  output [9:0]  PixelCord_y,
  output        InViewableArea
  );
  
  //Res: 800x600
  //Freq: 72Hz
  //Pixel freq: 50.0 Mhz
  //Vertical refresh: 48.076923076923 kHz
  
  reg [9:0] CounterX; //counter for x pixel index
  reg [9:0] CounterY; //counter for y pixel index
  
  reg Vsync;
  reg Hsync;
  
  wire CounterXmaxed;
    assign CounterXmaxed = ( CounterX == 799 );
  
  wire CounterYmaxed;
    assign CounterYmaxed = ( CounterY == 599 );
  
  //X pixel index update
  always @ ( posedge clk)
    if( rst | CounterXmaxed )
      CounterX <= 0;
    else
      CounterX <= CounterX + 1;

  //Y pixel index update
  always @ ( posedge clk )
  begin
    if( rst | CounterYmaxed )
      CounterY <= 0;
    else
      CounterY <= CounterY + 1;
  end
  
  always @(posedge clk)
  begin
    Hsync <= (CounterX[9:4]==0);   // active for 16 clocks
    Vsync <= (CounterY==0);   // active for 768 clocks
  end
  
  //DEBUG
 // assign Pixel_Bus = 8'b00111111;
  
  assign VGA_out[7:0] = Pixel_Bus;
  assign VGA_out[8] = Vsync;
  assign VGA_out[9] = Hsync;
 
endmodule
