`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:27:09 03/24/2017
// Design Name:   eq4
// Module Name:   /tmp/guest-cZFNDU/Desktop/eq1/eq4_test.v
// Project Name:  eq1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eq4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eq4_test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire res;

	// Instantiate the Unit Under Test (UUT)
	eq4 uut (
		.a(a), 
		.b(b), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		a = 4'b1111;
		b = 4'b1111;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		$display("Result for test1 = %b\n", res );
		#200;
		
		// Initialize Inputs
		a = 4'b1000;
		b = 4'b1010;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		$display("Result for test2 = %b\n", res );

		#200;
		// Initialize Inputs
		a = 4'b0011;
		b = 4'b0011;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		$display("Result for test3 = %b\n", res );
		#200;
		
		// Initialize Inputs
		a = 4'b1001;
		b = 4'b1001;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		$display("Result for test4 = %b\n", res );
		
	end
      
endmodule

