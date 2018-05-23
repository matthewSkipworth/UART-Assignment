module Mux_2_to_1(select, in1, in2, out);
	input select, in1, in2;
	output out;
	
	assign out = ((~select & in1) | (select & in2));
endmodule

module Mux_2_to_1_testbench;

	logic select, in1, in2, out;
	integer i;
	
	Mux_2_to_1 DUT(select, in1, in2, out);
	
	initial begin
		select = 0;
		in1 = 0; in2 = 0;  #10;
		assert(out == in1);
		in1 = 1; in2 = 0;  #10;
		assert(out == in1);
		in1 = 0; in2 = 1;  #10;
		assert(out == in1);
		in1 = 1; in2 = 1;  #10;
		assert(out == in1);
		select = 1;
		in1 = 0; in2 = 0;  #10;
		assert(out == in2);
		in1 = 1; in2 = 0;  #10;
		assert(out == in2);
		in1 = 0; in2 = 1;  #10;
		assert(out == in2);
		in1 = 1; in2 = 1;  #10;
		assert(out == in2);
	
	end
	
endmodule	