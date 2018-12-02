module ALU(a, b, cin, cou, result, chooser); // ControlLogic
	input[15:0] 	chooser;

	input[7:0]	a, b;
	input 		cin;
	output[7:0] result;
	output 		cou;
	
	wire 		AddCou;		//Couts.
	wire 		SubCou;
	wire 		LmCou;
	wire		RmCou;
	
	wire[7:0] 	AddResult;	//Results.
	wire[7:0] 	SubResult;
	wire[7:0] 	LmResult;
	wire[7:0] 	RmResult;
	wire[7:0] 	LmtResult;
	wire[7:0] 	RmtResult;
	wire[7:0]	NegResult;
	wire[7:0]	AndResult;
	wire[7:0]	OrResult;
	wire[7:0]	XorResult;
	
	reg[7:0]	result;		//ALU result.
	reg			cou;		//ALU Cout.

	Add ALU_add (a, b, cin, AddCou, AddResult);	//Algorithms.
	Sub ALU_sub (a, b, SubCou, SubResult);
	Lm ALU_lm (a, cin, LmCou, LmResult);
	Rm ALU_rm (a, cin, RmCou, RmResult);
	Lmt ALU_lmt (a, LmtResult);
	Rmt ALU_rmt (a, RmtResult);
	Neg ALU_neg (a, NegResult);
	And ALU_and (a, b, AndResult);
	Or ALU_or (a, b, OrResult);
	Xor ALU_xor (a, b, XorResult);
	
	always @ (chooser or a or b or cin)		//Seclet Algorithms.
	begin
		if ( chooser == 16'b0000000000000001 ) 		// Add
			begin
				result = AddResult;
				cou = AddCou;
			end
		else if ( chooser == 16'b0000000000000010 )	// Sub
			begin
				result = SubResult;
				cou = SubCou;
			end
		else if ( chooser == 16'b0000000000000100 )	// LeftMove
			begin
				result = LmResult;
				cou = LmCou;
			end
		else if ( chooser == 16'b0000000000001000 )	// RightMove
			begin
				result = RmResult;
				cou = RmCou;
			end
		else if ( chooser == 16'b0000000000010000 )	// LeftMove and Turn
			begin
				result = LmtResult;
				cou = 0;
			end
		else if ( chooser == 16'b0000000000100000 )	// RightMove and Turn
			begin
				result = RmtResult;
				cou = 0;
			end
		else if ( chooser == 16'b0000000001000000 )	//Negation
			begin
				result = NegResult;
				cou = 0;
			end
		else if ( chooser == 16'b0000000010000000 )	//AND
			begin
				result = AndResult;
				cou = 0;
			end
		else if ( chooser == 16'b0000000100000000 )	//OR
			begin
				result = OrResult;
				cou = 0;
			end
		else if ( chooser == 16'b0000001000000000 )	//XOR
			begin
				result = XorResult;
				cou = 0;
			end
	end
endmodule