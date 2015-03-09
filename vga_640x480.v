`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:55 12/28/2014 
// Design Name: 
// Module Name:    vga_640x480 
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
module vga_640x480(
		input wire clk,
		output reg Hsync,
		output reg Vsync,
		output reg[9:0] hc,
		output reg[9:0] vc,
		output reg vidon
    );

	parameter h_pixel = 800;
	parameter h_total = 521;
	parameter hbp = 144;
	parameter hfp = 784;
	parameter vbp = 31;
	parameter vfp = 511;
	reg vs_enable;
	
	always @(posedge clk)
	begin
		if (hc == h_pixel - 1)
		begin
			hc <= 0;
			vs_enable <= 1;
		end
		else
		begin
			hc <= hc + 1;
			vs_enable <= 0;
		end
	end
	
	always @(posedge clk)
	begin
		if (vs_enable == 1)
		begin
			if (vc == h_total - 1)
			begin
				vc <= 0;
			end
			else
				vc <= vc + 1;
		end
	end
	
	always @(*)
	begin
		if (hc < 96)
			Hsync = 0;
		else
			Hsync = 1;
	end
	
	always @(*)
	begin
		if (vc < 2)
			Vsync = 0;
		else
			Vsync = 1;
	end
	
	always @(*)
	begin
		if ((hc > hbp) && (hc < hfp) && (vc > vbp) && (vc < vfp))
		begin
			vidon = 1;
		end
		else
			vidon = 0;
	end
endmodule
