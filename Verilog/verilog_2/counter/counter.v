`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:19:55 03/29/2017 
// Design Name: 
// Module Name:    adder 
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
module adder(
	input [3:0]init,
	input set,
	input reset,
	input clk,
	output reg [3:0]out
);
	reg [25:0]count;
	//reg [3:0]n;
	
	always @(posedge clk) begin
		if(set == 1) begin
			out = init;
			count = 0;
		end
		else if(reset == 1) begin
			out = 0;
			count = 0;
		end
		else if(count == 50_000_000) begin
			count = 0;
			out = out + 1;
		end
		else begin
			count = count+1;
		end
		
	end
	

endmodule

