`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:45 03/24/2017 
// Design Name: 
// Module Name:    eq4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "eq2.v"

module eq4(
	input wire [3:0]a,
	input wire [3:0]b,
	input wire set,
	output wire res
);
	set <= 0;
	wire r1, r2;
	wire [3:0]t1,t2;
	
	assign t1 = a;
	
	initial 
	begin
	while (!set)
	begin
		#1;
	end
	end
	
	assign t2 = b;
	eq2 f1 (t1[1:0],t2[1:0], r1);
	eq2 f2 (t1[3:2], t2[3:2], r2);

	assign res = r1 & r2;

endmodule
