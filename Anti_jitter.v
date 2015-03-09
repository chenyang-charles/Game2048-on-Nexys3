`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:52 01/07/2015 
// Design Name: 
// Module Name:    Anti_jitter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Anti_jitter(button, 
                   clk, 
                   btn, 
						);

	input [4:0] button;
   input clk;
   output reg [4:0] btn;

	reg [31:0] counter;
	reg [5:0] btn_temp;
	reg pluse;
		
	always @(posedge clk) 
	begin
		btn_temp <= button;
		if(btn_temp != button) 
		begin
			counter <= 32'h00000000;
			pluse <= 0;
		end
		else 
		if (counter < 100000)
			counter <= counter + 1;
		else 
		begin
			btn <= button;
		end
	end    
   
endmodule
