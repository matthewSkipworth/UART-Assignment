module UART_TOP(clock, reset, TxData, XMitGo, TxEmpty, TxOut);

//instantiate the UART_XMIT
//feed the output of the UART_XMIT into the PISO_Eight_Bit_Register
//output

	input clock, reset, XMitGo;
	input logic [7:0] TxData;
	output TxEmpty, TxOut;
	
	logic RegEnable;
	
	UART_XMIT name0(clock, reset, TxEmpty, RegEnable);
	
	PISO_Eight_Bit_Register name1(XMitGo, TxData, RegEnable, reset, TxOut);
	
endmodule