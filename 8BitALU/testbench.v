module testbench();
	reg[7:0]	a, b;
	reg			cin;
	reg[15:0]	chooser;
	wire[7:0] 	out;
	wire		cou;
	
	ALU ALU (a, b, cin, cou, out, chooser);
	
	initial
		begin
			#0 a=8'd0;	b=8'd0;	cin=1'b0; chooser=16'b0000000000000000;
			#5 a=8'd100;	b=8'd100;	cin=1'b0; chooser=16'b0000000000000001;//Add
			#5 a=8'd100;	b=8'd50; 	cin=1'b0; chooser=16'b0000000000000001;
			#5 a=8'd50;		b=8'd100; 	cin=1'b0; chooser=16'b0000000000000001;
			
			#5 a=8'd100;	b=8'd100;	cin=1'b0; chooser=16'b0000000000000010;//Sub
			#5 a=8'd100;	b=8'd50;	cin=1'b0; chooser=16'b0000000000000010;
			#5 a=8'd50;		b=8'd100;	cin=1'b0; chooser=16'b0000000000000010;
			
			#5 a=8'd100;	b=8'd0; 	cin=1'b0; chooser=16'b0000000000000100;//Lm
			#5 a=8'd50; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000000100;
			#5 a=8'd129; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000000100;
			#5 a=8'd100; 	b=8'd0; 	cin=1'b1; chooser=16'b0000000000000100;
			#5 a=8'd50; 	b=8'd0; 	cin=1'b1; chooser=16'b0000000000000100;
			#5 a=8'd129; 	b=8'd0; 	cin=1'b1; chooser=16'b0000000000000100;
			
			#5 a=8'd100;	b=8'd0; 	cin=1'b0; chooser=16'b0000000000001000;//Rm
			#5 a=8'd50; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000001000;
			#5 a=8'd129; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000001000;
			#5 a=8'd100; 	b=8'd0; 	cin=1'b1; chooser=16'b0000000000001000;
			#5 a=8'd50; 	b=8'd0; 	cin=1'b1; chooser=16'b0000000000001000;
			#5 a=8'd129; 	b=8'd0; 	cin=1'b1; chooser=16'b0000000000001000;
			
			#5 a=8'd100;	b=8'd0; 	cin=1'b0; chooser=16'b0000000000010000;//Lmt
			#5 a=8'd50; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000010000;
			#5 a=8'd129; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000010000;
			
			#5 a=8'd100;	b=8'd0; 	cin=1'b0; chooser=16'b0000000000100000;//Rmt
			#5 a=8'd50; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000100000;
			#5 a=8'd129; 	b=8'd0;		cin=1'b0; chooser=16'b0000000000100000;
			
			#5 a=8'd85; 	b=8'd0;		cin=1'b0; chooser=16'b0000000001000000;//Neg  0101 0101
			#5 a=8'd170; 	b=8'd0;		cin=1'b0; chooser=16'b0000000001000000;		//1010 1010
			
			#5 a=8'd85; 	b=8'd211;	cin=1'b0; chooser=16'b0000000010000000;//AND  0101 0101 and 1101 0011
			#5 a=8'd170; 	b=8'd102;	cin=1'b0; chooser=16'b0000000010000000;		//1010 1010 and 0110 0110
			
			#5 a=8'd85; 	b=8'd211;	cin=1'b0; chooser=16'b0000000100000000;//OR   0101 0101 and 1101 0011
			#5 a=8'd170; 	b=8'd102;	cin=1'b0; chooser=16'b0000000100000000;		//1010 1010 and 0110 0110
			
			#5 a=8'd85; 	b=8'd211;	cin=1'b0; chooser=16'b0000001000000000;//XOR  0101 0101 and 1101 0011
			#5 a=8'd170; 	b=8'd102;	cin=1'b0; chooser=16'b0000001000000000;		//1010 1010 and 0110 0110
			
			#5 $finish;
		end

	initial
		$monitor("now chooser is %b, cin=%b ,a=%b, b=%b, result=%b, cou=%b", chooser, cin, a, b, out, cou);

	initial
		$dumpvars(0, testbench);
endmodule