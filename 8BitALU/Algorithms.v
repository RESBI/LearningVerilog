module Add(a, b, cin, cou, result);	//Add
	input[7:0]	 	a, b;
	input	 		cin;
	output[7:0] 	result;
	output 			cou;
	wire[8:0] 		sum;
	
	assign sum = a + b + cin;
	assign cou = sum[8];
	assign result = sum;
endmodule

module Sub(a, b, cou, result);		//Sub
	input[7:0]	a, b;
	output[7:0]	result;
	output		cou;
	
	reg			cou;
	
	always @ (a or b)
	begin
		if ( a > b )
			cou = 1;
		else
			cou = 0;
	end
	
	assign result = a - b;
endmodule

module Lm(a, cin, cou, result);		//LeftMove
	input[7:0]	a;
	input		cin;
	output[7:0]	result;
	output		cou;
	
	assign cou = a[7];
	assign result = (a<<1) + cin;
endmodule

module Rm(a, cin, cou, result);		//RightMove
	input[7:0]	a;
	input		cin;
	output[7:0]	result;
	output		cou;
	
	assign cou = a[0];
	assign result = (a>>1) + (cin<<7);
endmodule

module Lmt(a, result);				//LeftMove and Turn
	input[7:0]	a;
	output[7:0]	result;
	
	assign result = (a<<1) + (a[7]);
endmodule

module Rmt(a, result);				//RightMove and Turn
	input[7:0]	a;
	output[7:0]	result;
	
	assign result = (a>>1) + (a<<7);
endmodule

module Neg(a, result);				//result = !a
	input[7:0]	a;
	output[7:0]	result;
	assign result = ~a;
endmodule

module And(a, b, result);			//result = a and b
	input[7:0]	a, b;
	output[7:0]	result;
	assign result = a & b;
endmodule

module Or(a, b, result);			//result = a or b
	input[7:0]	a, b;
	output[7:0]	result;
	assign result = a | b;
endmodule

module Xor(a, b, result);			//result = a xor b
	input[7:0]	a, b;
	output[7:0]	result;
	assign result = a ^ b;
endmodule