`include "blinker.v"
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:42:01 03/06/2017
// Design Name:   blink
// Module Name:   /home/cse/Desktop/Blink/blinkTest.v
// Project Name:  Blink
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blink
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blinkTest;

	// Inputs
	reg clk;

	// Outputs
	wire ledpin;

	// Instantiate the Unit Under Test (UUT)
	blink uut (
		.clk(clk), 
		.ledpin(ledpin)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      // clock signal
	always begin
		#10 clk = !clk;
	end
endmodule

