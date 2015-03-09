`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:35 01/07/2015 
// Design Name: 
// Module Name:    count_26bits 
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
module counter_26bit(
					clk, 
               clk_1ms
					);

    input clk;
   output clk_1ms;
   
	parameter COUNTER=26;
   reg [COUNTER-1:0] count;
	reg second_m;
	reg adjust;
	
	
	initial 
	begin
		count <= 0;
		adjust <= 0;
	end
	
	always@(posedge clk)
	begin
	   if((count[15:0]==49999) && (adjust == 1))
		begin
			count[15:0] <= 0;
			count[25:16] <= count[25:16]+1;
			adjust <= 0;
			second_m <= 1;
		end
		else 
		if (adjust == 1)
		begin
			count <= count+1;
			adjust <= 0;
			second_m <= 0;
		end
		else
		begin
			adjust <= 1;
		end
	end
	
	assign clk_1ms = second_m;

endmodule
