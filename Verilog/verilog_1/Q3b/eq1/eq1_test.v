`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:36:00 03/24/2017
// Design Name:   eq1
// Module Name:   /tmp/guest-cZFNDU/Desktop/eq1/eq1_test.v
// Project Name:  eq1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eq1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eq1_test;

	// Inputs
	reg b1;
	reg b2;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	eq1 uut (
		.b1(b1), 
		.b2(b2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		b1 = 0;
		b2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

