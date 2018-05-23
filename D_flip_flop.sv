//Matthew Skipworth
//TCES330, Friday Section

//D flip-flop module.
module D_flip_flop(enable, clk, reset, q);
	input enable, clk, reset;
	output logic q;

always @ ( posedge clk/* or negedge reset*/)
  if (reset) begin
    q <= 1'b0;
  end  else begin
    q <= enable;
  end
  
endmodule

module D_flip_flop_testbench;

	logic enable, clk, reset, q;
	
	integer i;
	
	D_flip_flop DUT(enable, clk, reset, q);
	
	initial begin
		enable = 0;
		reset = 0;
		for (i = 0; i < 4; i++) begin
			clk = 1;
			#10;
			clk = 0;
			#10;
			
		end	
		enable = 0;
		reset = 1;
		for (i = 0; i < 4; i++) begin
			clk = 1;
			#10;
			clk = 0;
			#10;
			
		end	
		enable = 1;
		reset = 0;
		for (i = 0; i < 4; i++) begin
			clk = 1;
			#10;
			clk = 0;
			#10;
			
		end	
		enable = 1;
		reset = 1;
		for (i = 0; i < 4; i++) begin
			clk = 1;
			#10;
			clk = 0;
			#10;
			
		end	
	end
endmodule
