module UART_XMIT(clock, reset, TxEmpty, RegEnable);
	input clock, reset;
	output logic TxEmpty = 0, RegEnable = 0;

	logic [31:0] Counter, Bit_Count;
	
	always @(posedge clock) begin
		if (reset) begin
			Counter <= 0;
			TxEmpty <= 1;
		end else begin
			if(Counter < 1302) begin
				RegEnable <= 0;
				Counter <= Counter + 1;
			end else begin
				Bit_Count <= Bit_Count + 1;
				RegEnable <= 1;
				if (Bit_Count >= 10) begin
					TxEmpty <= 1;
					Bit_Count <= 0;
					
				end
				Counter <= 0;
			end
		end
	end
endmodule

module UART_XMIT_testbench;
 
	logic clock, reset, TxEmpty = 0, RegEnable;
	//logic [7:0] TxData;
	
	UART_XMIT DUT(clock, reset, TxEmpty, RegEnable);
	
	integer i; 
	
	
	initial begin
	
	reset = 0;
	//XMitGo = 0;
	//TxData = 8'b01010101;
	
		for (i = 0; i < 26040; i++) begin
			clock = 1;
			#10;
			clock = 0;
			#10;
			//XMitGo <=0;
		end
	reset = 1;
	//XMitGo = 1;
	//TxData = 8'b01010101;
	
		for (i = 0; i < 13020; i++) begin
			clock = 1;
			#10;
			clock = 0;
			#10;
			//XMitGo <=0;
		end
	
	/*reset = 1;
	//XMitGo = 0;
	//TxData = 8'b01010101;
	
		for (i = 0; i < 13020; i++) begin
			clock = 1;
			#10;
			clock = 0;
			#10;
			//XMitGo <=0;
		end
	reset = 1;
	//XMitGo = 1;
	//TxData = 8'b01010101;
	
		for (i = 0; i < 13020; i++) begin
			clock = 1;
			#10;
			clock = 0;
			#10;
			//XMitGo <=0;
		end*/
	end
endmodule	
