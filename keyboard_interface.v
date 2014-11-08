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

  wire negedgeKeyClkReg;
    assign negedgeKeyClkReg = ( clkKeyboardReg[1] & ~clkKeyboardReg[0] )? 1 : 0;

  reg [1:0] clkKeyboardReg;  
  always@ ( posedge clk )
  begin
    if( rst )
      clkKeyboardReg <= 0;
    else 
      clkKeyboardReg <= {clkKeyboardReg, clkKeyboard};
  end

  reg [10:0] keyShrReg;
  always@ ( posedge clk )
  begin
    if( rst )
      keyShrReg <= 0;
    else if ( negedgeKeyClkReg )
      keyShrReg <= { keyShrReg, data };
  end
  
wire isValid_wire;
  assign isValid_wire = ( |keyShrReg[9:1] & ~keyShrReg[0] & keyShrReg[10] );

assign keyCodeOut = ( isValid_wire ) ? keyShrReg[7:0] : 0;

endmodule
