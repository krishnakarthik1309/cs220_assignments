`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:20 03/24/2017 
// Design Name: 
// Module Name:    eq2 
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
`include "eq1.v"

module eq2(
	input wire [1:0] a,b,
	output wire out
);
	wire r1, r2;
	eq1 f1 (a[0], b[0], r1);
	eq1 f2 (a[1], b[1], r2);
	
	assign out = r1 & r2;
endmodule
