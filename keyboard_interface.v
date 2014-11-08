`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SmileWakers Inc.
// Engineer: Gazben
//
// Module Name:    keyboar_interface 
// Project Name:   Tetrix
//////////////////////////////////////////////////////////////////////////////////
module keyboard_interface(
  input clk,               // Clock pin form keyboard
  input clkKeyboard,        //clock of the keyboard
  input rst,                //reset signal
  input data,              //Data pin form keyboard
  output [7:0] keyCodeOut   //Printing input data to led
  );
  
  reg [10:0] keyShrReg;
  
  always@ ( posedge clk )
  begin
    if( rst )
      keyShrReg := 0;
    //else if(  )
      
  end

assign keyCodeOut = 8'b00000001;

endmodule
