module SevenSegment(
	input [3:0] hexDigit,
	output [6:0] segments
	);
	
	wire b1, b2, b3, b4;
	wire [6:0] s;
	
	assign b0 = hexDigit[0];
	assign b1 = hexDigit[1];
	assign b2 = hexDigit[2];
	assign b3 = hexDigit[3];
	
	assign s[0] = (b1 & b2) | (~b1 & ~b2 & b3) | (~b0 & b3) |
					  (~b0 & ~b2) | (b0 & b1 & b3) | (b1 & ~b3);
	
	assign s[1] = (~b1 & ~b0 & ~b3) | (b1 & b0 & ~b3) | 
					  (~b1 & b0 & b3) | (b1 & ~b0 & ~b2) |
					  (~b3 & ~b2);
					  
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
					  
   //invert the outputs for active low
	assign segments = ~s;
	
	endmodule
	