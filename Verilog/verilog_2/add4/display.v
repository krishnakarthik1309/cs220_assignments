`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:28 03/24/2017 
// Design Name: 
// Module Name:    display 
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

module display(
 input clk, // pin C9 is the 50-MHz on-board clock
 
 output reg sf_e, // 1 LCD access (0 strataFlash access)
 output reg e, // enable (1)
 output reg rs,// Register Select (1 data bits for R/W)
 output reg rw,// Read/Write 1/0
 output reg [3:0]D
);

reg [26:0] count = 0;	// 27-bit count, 0-(128M-1), over 2 secs
reg [5:0] code;	// 6-bits different signals to give out
reg refresh;	// refresh LCD rate @ about 25Hz

always @ (posedge clk) begin
count <= count + 1;

case (count [26:21])	// as top 6 bits change
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
	
	// Chararters are then given out, the cursor will advance to the right 
	
	12: code <= 6'h24; // 'C' high nibble 
	13: code <= 6'h23; // 'C' low nibble 
	14: code <= 6'h26; // o 
	15: code <= 6'h2F; 
	16: code <= 6'h26; // m 
	17: code <= 6'h2D; 
	18: code <= 6'h27; // p 
	19: code <= 6'h20;
	20: code <= 6'h25; // u 
	21: code <= 6'h2F;
	22: code <= 6'h27; // t 
	23: code <= 6'h24;
	24: code <= 6'h26; // e 
	25: code <= 6'h25;
	26: code <= 6'h27; // r 
	27: code <= 6'h22;    
	28: code <= 6'b001100; // pos cursor to 2nd line upper nibble 
	29: code <= 6'b000000; // lower nibble: h0 
	
	// Characters are then given out, the cursor will advance to the right 
	//next line
	30: code <= 6'h24; // O 
	31: code <= 6'h2F; 
	32: code <= 6'h27; // r 
	33: code <= 6'h22; 
	34: code <= 6'h26; // g 
	35: code <= 6'h27; 
	36: code <= 6'h26; // a 
	37: code <= 6'h21; 
	38: code <= 6'h26; // n 
	39: code <= 6'h2E; 
	40: code <= 6'h26; // i
	41: code <= 6'h29; 
	42: code <= 6'h27; // z
	43: code <= 6'h2A; 
	44: code <= 6'h26; // a
	45: code <= 6'h21; 
	46: code <= 6'h27; // t
	47: code <= 6'h24; 
	48: code <= 6'h26; // i
	49: code <= 6'h29; 
	50: code <= 6'h26; // o
	51: code <= 6'h2F; 
	52: code <= 6'h26; // n 
	53: code <= 6'h2E; 
	
	
	default: code <= 6'h10; // the rest unused time 
endcase 
// refresh (enable) the LCD when bit 20 of the count is 1 
refresh <= count[ 20 ]; 
sf_e <= 1;
e <= refresh; 
rs <= code[5]; 
rw <= code[4]; 
D[3] <= code[3]; 
D[2] <= code[2];  
D[1] <= code[1];
D[0] <= code[0]; 

end

endmodule
