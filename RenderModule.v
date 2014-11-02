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
  
  output [7:0]  VGA_out,
  output [9:0]  PixelCord_x, 
  output [9:0]  PixelCord_y,
  output        InViewableArea
  );
  
  //Res: 800x600
  //Freq: 72Hz
  //Pixel freq: 50.0 Mhz
  //Vertical refresh: 48.076923076923 kHz
  
  reg [10:0] CounterX; //counter for x pixel index
  reg [9:0] CounterY; //counter for y pixel index
  
  reg Vsync;
  reg Hsync;
  
  wire CounterXmaxed;
    assign CounterXmaxed = ( CounterX == 1039 );
  
  wire CounterYmaxed;
    assign CounterYmaxed = ( CounterY == 665 );
  
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
    else if(CounterXmaxed)
      CounterY <= CounterY + 1;
  end
  
  always @( posedge clk )
  begin
		if(rst | CounterX==975)
			Hsync <= 0;
		else if(CounterX==855)
			Hsync <= 1;
  end
  
    always @( posedge clk )
  begin
		if(rst | CounterY==642 & CounterX==1039)
			Vsync <= 0;
		else if(CounterY==636 & CounterX==1039)
			Vsync <= 1;
  end
  
  //CONSTANT IS FOR DEBUG!
  assign VGA_out[5:0] = (CounterX<800 & CounterY<600)?6'b001111:6'b0;
  assign VGA_out[6] = Vsync;
  assign VGA_out[7] = Hsync;
 
endmodule
