`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:00:22 04/05/2017
// Design Name:   alu4
// Module Name:   C:/Users/karthik/Desktop/cs220/group1_ass3/alu4/alu4_test.v
// Project Name:  alu4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu4_test;

	// Inputs
	reg [3:0] p;
	reg set1;
	reg set2;
	reg set3;
	reg clk;

	// Outputs
	wire [3:0] out;
	wire CF;
	wire ZF;
	wire SF;
	wire e;
	wire sf_e;
	wire rs;
	wire rw;
	wire d;
	wire c;
	wire b;
	wire a;

	// Instantiate the Unit Under Test (UUT)
	alu4 uut (
		.p(p), 
		.set1(set1), 
		.set2(set2), 
		.set3(set3), 
		.clk(clk), 
		.out(out), 
		.CF(CF), 
		.ZF(ZF), 
		.SF(SF), 
		.e(e), 
		.sf_e(sf_e), 
		.rs(rs), 
		.rw(rw), 
		.d(d), 
		.c(c), 
		.b(b), 
		.a(a)
	);

	initial begin
		// Initialize Inputs
		p = 0;
		set1 = 0;
		set2 = 0;
		set3 = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

