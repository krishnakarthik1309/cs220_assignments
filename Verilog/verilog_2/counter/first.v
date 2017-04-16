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
	input [3:0]p,
	input set1,
	input set2,
	input clk,
	output reg [3:0]sum,
	output reg carry,
// for display registers
	output reg e,
	output reg sf_e, // 1 LCD access (0 strataFlash access)
	output reg rs,// Register Select (1 data bits for R/W)
	output reg rw,// Read/Write 1/0
(* LOC = "M15" *) output reg d,	// 4th data bits (to form a nibble)
(* LOC = "P17" *) output reg c,	// 3rd data bits (to form a nibble)
(* LOC = "R16" *) output reg b,	// 2nd data bits (to form a nibble)
(* LOC = "R15" *) output reg a	// 1st data bits (to form a nibble)

);
	reg [3:0] n1,n2; 
	reg [5:0] code;
	reg [24:0]count;
	reg refresh;
	//reg [3:0] temp;

	
	always @(posedge clk) begin
		if(set1 == 1) begin
			n1 = p;
			count = 0;
		end
		else if(set2 == 1) begin
			n2 = p;
			count = 0;
		end
		else begin
			count = count+1;
		end
		//sum[3:0] <= temp;
		//sum[4] <= carry;
		assign {carry, sum} = n1 + n2;
	end
	
	//assign carry = n1[3] & n2[3];
	
	reg [3:0]hex;
	
	always @(n1 or n2 or count) begin
	
	case (count[24:21])
		// Initialization
	0: code <= 6'h03;
	1: code <= 6'h03;
	2: code <= 6'h03;
	3: code <= 6'h02;	
	
	// Function Set -- Send 00 and upper nibble 0010, then 00 and lower nibble 10xx
	4: code <= 6'h02; // Function Set, upper nibble 0010 
	5: code <= 6'h08; // lower nibble 1000 (10xx)
	
	// Entry Mode -- send 00 and upper nibble: I/D bit (Incr 1, Decr 0), S bit (Shift 1, 0 no) 
	6: code <= 6'h00; 
	7: code <= 6'h06; 
	
	// Display On/Off 
	// send 00 and upper nibble 0000, then 00 and lower nibble 1 DCB 
	// D: 1, show char represented by code in DDR, 0 don't, but code remains 
	// C: 1, show cursor, 0 don't 
	// B: 1, cursor blinks (if shown), 0 don't blink (if shown) 
	8: code <= 6'h00; // Display On/Off, upper nibble 0000 
	9: code <= 6'h0C; // lower nibble 1111 (1 D C B)
	
	// Clear Display, 00 and upper nibble 0000, 00 and lower nibble 0001 
	10: code <= 6'h00; 
	11: code <= 6'h01; 
	12: 	begin
			case (sum)
			0: code <= 6'h23; // '0' high nibble 
			1: code <= 6'h23; // '1' high nibble 
			2: code <= 6'h23; // '2' high nibble 
			3: code <= 6'h23; // '3' high nibble 
			4: code <= 6'h23; // '4' high nibble 
			5: code <= 6'h23; // '5' high nibble 
			6: code <= 6'h23; // '6' high nibble 
			7: code <= 6'h23; // '07' high nibble 
			8: code <= 6'h23; // '08' high nibble 		
			9: code <= 6'h23; // '9' high nibble 				
			10:code <= 6'h26; // 'a' high nibble 
			11:code <= 6'h26; // 'b' high nibble 
			12:code <= 6'h26; // 'c' high nibble 	
			13:code <= 6'h26; // 'd' high nibble 
			14:code <= 6'h26; // 'e' high nibble 
			15:code <= 6'h26; // 'f' high nibble 
			endcase
			end
		13: begin
			// Display for lower nibble
			case (sum)
			0: code <= 6'h20; // '0' low nibble 
			1: code <= 6'h21; // '1' low nibble 
			2: code <= 6'h22; // '2' low nibble 
			3: code <= 6'h23; // '3' low nibble 
			4: code <= 6'h24; // '4' low nibble 
			5: code <= 6'h25; // '5' low nibble 
			6: code <= 6'h26; // '6' low nibble 
			7: code <= 6'h27; // '7' low nibble 
			8: code <= 6'h28; // '8' low nibble 			
			9: code <= 6'h29; // '9' low nibble 
			10:code <= 6'h21; // 'a' low nibble
			11:code <= 6'h22; // 'b' low nibble 
			12:code <= 6'h23; // 'c' low nibble 	
			13:code <= 6'h24; // 'd' low nibble 
			14:code <= 6'h25; // 'e' low nibble 
			15:code <= 6'h26; // 'f' low nibble 
			endcase
			end
		default: code <= 6'h10; // the rest unused time 
	endcase
	refresh <= count[ 20 ]; 
	sf_e <= 1;
	e <= refresh;
		rs = code[5]; rw = code[4]; 
		d = code[3]; c = code[2];  
		b = code[1]; a = code[0]; 
		//#500;
	end
	

endmodule

