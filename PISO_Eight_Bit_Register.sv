//Matthew Skipworth & Bruce Baker
//TCES330, Friday Section

//Eight bit register. Serial in, Serial out.
module PISO_Eight_Bit_Register(enable, TxData, pulse, reset, q_out);

	input logic [7:0] TxData; //TxData
	input pulse, reset, enable;
	logic [9:0] mux_in, D;
	output logic q_out = 1;
	
	localparam START_BIT = 1'b0,
				STOP_BIT = 1'b1;
	
	//module Mux_2_to_1(select, in1, in2, out);
	Mux_2_to_1 Mux0(enable, 1'b0, STOP_BIT, D[9]);
	//module D_flip_flop(enable, pulse, reset, q);
	D_flip_flop D0(D[9], pulse, reset, mux_in[0]);
	
	Mux_2_to_1 Mux1(enable, mux_in[0], TxData[7], D[8]);
	D_flip_flop D1(D[8], pulse, reset, mux_in[1]);
	
	Mux_2_to_1 Mux2(enable, mux_in[1], TxData[6], D[7]);
	D_flip_flop D2(D[7], pulse, reset, mux_in[2]);
	
	Mux_2_to_1 Mux3(enable, mux_in[2], TxData[5], D[6]);
	D_flip_flop D3(D[6], pulse, reset, mux_in[3]);
	
	Mux_2_to_1 Mux4(enable, mux_in[3], TxData[4], D[5]);
	D_flip_flop D4(D[5], pulse, reset, mux_in[4]);
	
	Mux_2_to_1 Mux5(enable, mux_in[4], TxData[3], D[4]);
	D_flip_flop D5(D[4], pulse, reset, mux_in[5]);
	
	Mux_2_to_1 Mux6(enable, mux_in[5], TxData[2], D[3]);
	D_flip_flop D6(D[3], pulse, reset, mux_in[6]);
	
	Mux_2_to_1 Mux7(enable, mux_in[6], TxData[1], D[2]);
	D_flip_flop D7(D[2], pulse, reset, mux_in[7]);
	
	Mux_2_to_1 Mux8(enable, mux_in[7], TxData[0], D[1]);
	D_flip_flop D8(D[1], pulse, reset, mux_in[8]);
	
	Mux_2_to_1 Mux9(enable, mux_in[8], START_BIT, D[0]);
	D_flip_flop D9(D[0], pulse, reset, q_out);
	

endmodule

module PISO_Eight_Bit_Register_testbench;

	logic [7:0] TxData;
	logic enable, pulse, reset;
	logic q_out = 0;
	
	integer i = 0;
	PISO_Eight_Bit_Register DUT(enable, TxData, pulse, reset, q_out);
	initial begin
	
		TxData = 8'b10101010;
		
		reset = 0;
			pulse = 1;
			#10;
			pulse = 0;
			#10;
			reset = 1;
		enable = 1;
	
			//pulse = 1;
			//#10;
			//pulse = 0;
			//#10;
			pulse = 1;
			#10;
			pulse = 0;
			#10;
			enable = 0;

		for (i = 0; i < 16; i++) begin
			pulse = 1;
			#10;
			pulse = 0;
			#10;
		end
		
		reset = 0;
		
		enable = 1;
	
			//pulse = 1;
			//#10;
			//pulse = 0;
			//#10;
			pulse = 1;
			#10;
			pulse = 0;
			#10;
			enable = 0;

		for (i = 0; i < 16; i++) begin
			pulse = 1;
			#10;
			pulse = 0;
			#10;
		end
		
	
	
	end
	
endmodule	