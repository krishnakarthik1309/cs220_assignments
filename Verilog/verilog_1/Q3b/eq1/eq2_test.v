`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:55 03/24/2017
// Design Name:   eq2
// Module Name:   /tmp/guest-cZFNDU/Desktop/eq1/eq2_test.v
// Project Name:  eq1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eq2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eq2_test;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	eq2 uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 2'b10;
		b = 2'b11;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		if(test == 1)
			$display("Both are same");
		else
			$display("They are not same");
		end
		
		#200;
		
		
		// Initialize Inputs
		a = 2'b11;
		b = 2'b11;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		if(test == 1)
			$display("Both are same");
		else
			$display("They are not same");
		end
		
		
		#200;
		
		// Initialize Inputs
		a = 2'b10;
		b = 2'b10;
		// Wait 100 ns for global reset to finish
		#100; 
		// Add stimulus here
		if(test == 1)
			$display("Both are same");
		else
			$display("They are not same");
		end
		
		#200;	
			
		// Initialize Inputs
		a = 2'b00;
		b = 2'b01;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		if(test == 1)
			$display("Both are same");
		else
			$display("They are not same");
		end
	end
      
endmodule

