
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module AddingMachine(

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

	assign LEDR = SW;
	
	wire [4:0] A = SW[4:0];
	wire [4:0] B = SW[9:5];
	
	wire[5:0] Sum;
	assign Sum = A + B;
	
	SevenSegment Hex0 (Sum[3:0], 1, HEX0);
	SevenSegment Hex1 (Sum[5:4], |Sum[5:4], HEX1);
	
	//Leftmost Segment
	SevenSegment Hex4 (B[3:0], 1, HEX4);
	SevenSegment Hex5 (B[4], B[4], HEX5);
	
	//Rightmost Segment
	SevenSegment Hex2 (A[3:0], 1, HEX2);
	SevenSegment Hex3 (A[4], A[4], HEX3);
	
endmodule
	

	// Responsible for driving the Seven Segment Display
module SevenSegment(
	input [3:0] hexDigit, input enable,
	output [6:0] segments );
	
	wire b0, b1, b2, b3;
	wire [6:0] s;
	

	assign b0 = hexDigit[0];
	assign b1 = hexDigit[1];
	assign b2 = hexDigit[2];
	assign b3 = hexDigit[3];
				
	assign s[0] = (b1 & b2) | (~b1 & ~b2 & b3) | (~b0 & b3) |
					  (~b0 & ~b2) | (b0 & b2 & ~b3) | (b1 & ~b3);
	
	assign s[1] = (~b1 & ~b0 & ~b3) | (b1 & b0 & ~b3) | 
					  (~b1 & b0 & b3) | (b1 & ~b0 & ~b2) |
					  (~b3 & ~b2) | (b3 & ~b2 & ~b1);
					  
	assign s[2] = (~b3 & ~b2 & ~b1) | (~b3 & ~b2 & b0) | (~b3 & b2) |
					  (b3 & ~b2) | (~b1 & b0);
					  
	assign s[3] = (~b3 & ~b2 & ~b0) | (~b1 & ~b0 & b3) | ( ~b1 & b0 & b2)
					  | ( b1 & b0 & ~b2) | (b1 & ~b0 & b2);
					
	assign s[4] = (~b1 & ~b0 & ~b2) | (b1 & ~b0) | (b3 & b2) |
					  (b3 & ~b2 & b1);
					  
	assign s[5] = (~b1 & ~b0) | (b3 & ~b2) | (~b3 & b2 & ~b1) | 
					  (b3 & b2 & b1) | (b1 & ~b0 & b2);
					  
	assign s[6] = (~b3 & ~b2 & b1) | (~b3 & b2 & ~b1) | (b3 & b2 & b0) |
					  (b3 & ~b2) | (b1 & ~b0);		
				
	assign segments = enable ? ~s : ~0;
   //invert the outputs for active low
	
endmodule

