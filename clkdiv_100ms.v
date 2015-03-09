`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:01 01/07/2015 
// Design Name: 
// Module Name:    clkdiv_100ms 
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
module clkdiv_100ms(
  			input clk,
			output reg clk_100ms
    );
	 reg [31:0] count;
	 
	 always @(posedge clk)
	 begin
			if (count < 15000000)
			begin
				count <= count + 1;
				clk_100ms <= 0;
			end
			else
			begin
				count <= 0;
				clk_100ms <= 1;
			end
	 end
	
endmodule
