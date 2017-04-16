`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:55 04/12/2017 
// Design Name: 
// Module Name:    regfile 
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
module regfile(
	
	input [3:0] p,
	
	input clk,
	input setRR1,
	input setRR2,
	input setWR,
	input setWData,
	input Wenable,
	
	output reg [3:0] OutR1,
	output reg [3:0] OutR2
	
);
	reg [3:0] n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15;
	reg [3:0] RR1;
	reg [3:0] RR2;
	reg [3:0] WR;
	reg [3:0] WData;
	/*
   RR1 = 4'b0000;
	RR2 = 4'b0000;
	*/
	always @(posedge clk) begin
		// printing RR1 in LEds
		case( RR1)
			0: OutR1 = n0;
			1: OutR1 = n1;
			2: OutR1 = n2;
			3: OutR1 = n3;
			4: OutR1 = n4;
			5: OutR1 = n5;
			6: OutR1 = n6;
			7: OutR1 = n7;
			8: OutR1 = n8;
			9: OutR1 = n9;
			10: OutR1 = n10;
			11: OutR1 = n11;
			12: OutR1 = n12;
			13: OutR1 = n13;
			14: OutR1 = n14;
			15: OutR1 = n15;
			endcase
			// printing RR2 into LEds
			case( RR2)
			0: OutR2 = n0;
			1: OutR2 = n1;
			2: OutR2 = n2;
			3: OutR2 = n3;
			4: OutR2 = n4;
			5: OutR2 = n5;
			6: OutR2 = n6;
			7: OutR2 = n7;
			8: OutR2 = n8;
			9: OutR2 = n9;
			10: OutR2 = n10;
			11: OutR2 = n11;
			12: OutR2 = n12;
			13: OutR2 = n13;
			14: OutR2 = n14;
			15: OutR2 = n15;
			endcase

	end
	
	always @(posedge clk) begin
		if( setRR1 == 1 )begin
			RR1 = p;
		end	
		
		else if( setRR2 == 1 )begin
			RR2 = p;	
		end		
		
		else if( setWR == 1 )begin
			WR = p;
		end
		
		else if( setWData == 1 )begin
			WData = p;
		end
		
		else if( Wenable == 1 )begin
		// now write the register which is to be updated
			case( WR )
			0:  n0 = WData;
			1:  n1 = WData;
			2:  n2 = WData;
			3:  n3 = WData;
			4:  n4 = WData;
			5:  n5 = WData;
			6:  n6 = WData;
			7:  n7 = WData;
			8:  n8 = WData;
			9:  n9 = WData;
			10: n10 = WData;
			11: n11 = WData;
			12: n12 = WData;
			13: n13 = WData;
			14: n14 = WData;
			15: n15 = WData;
			endcase
			
		end	
	
	end // the always block end
	
endmodule

/*
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
	

endmodule*/