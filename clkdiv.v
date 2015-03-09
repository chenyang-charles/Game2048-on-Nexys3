`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:29 01/01/2015 
// Design Name: 
// Module Name:    clkdiv 
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
module clkdiv(
			input clk100,
			output clk25
    );
	 reg [1:0] count;
	 
	 always @(posedge clk100)
	 begin
			count <= count + 1;
	 end

	assign clk25 = count[1];
endmodule
