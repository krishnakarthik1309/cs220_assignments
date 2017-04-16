`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:02 03/24/2017 
// Design Name: 
// Module Name:    eq1 
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
module eq1(
	input wire b1,
	input wire b2,
	output wire out
);

assign a = b1 & b2;
assign b = ~b1 & ~ b2;

assign out = a | b;

endmodule