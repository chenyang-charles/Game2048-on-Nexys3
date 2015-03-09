`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:28 01/02/2015 
// Design Name: 
// Module Name:    Top_2048 
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
module Top_2048(
			input wire clk,
			input wire PS2KeyboardClk,
			input wire PS2KeyboardData,
			input wire [4:0] btn,
			output wire Hsync,
			output wire Vsync,
			output wire [2:0] vgaRed,
			output wire [2:0] vgaGreen,
			output wire [2:0] vgaBlue
    );

	wire clk25; 
	wire [7:0] data;
	wire win;
	wire isEnd;
	wire [63:0] map;
	wire vidon;
	wire [9:0] hc;
	wire [9:0] vc;
	wire [15:0] addrNumber;
	wire [15:0] addrTitle;
	wire info_number;
	wire info_title;
	wire [7:0] info_win;
	wire [7:0] info_end;
	wire clk_100ms;
	wire [15:0] xkey;


	clkdiv U0(.clk100(clk), .clk25(clk25));
	
	vga_640x480 U1(.clk(clk25), .Hsync(Hsync), .Vsync(Vsync), .hc(hc), .vc(vc), .vidon(vidon));

	vga_display U2(.clk(clk25), .vidon(vidon), .data(data), .vgaRed(vgaRed), .vgaGreen(vgaGreen), .vgaBlue(vgaBlue));

	control U3(.clk(clk25), .vidon(vidon), .hc(hc), .vc(vc), .win(win), .isEnd(isEnd), .map(map),
	.data(data), .addrNumber(addrNumber), .addrTitle(addrTitle),
	.info_number(info_number), .info_title(info_title), .info_win(info_win), .info_end(info_end));
	
	number U4(.addra(addrNumber), .clka(clk25), .douta(info_number));
	
	title U5(.addra(addrTitle), .clka(clk25), .douta(info_title));
		
	move_event U6(.clk(clk_100ms), .btn(btn), .xkey(xkey), .win(win), .isEnd(isEnd), .map(map));
	
	clkdiv_100ms U7(.clk(clk), .clk_100ms(clk_100ms));
	
	keyboard U8(.clk25(clk25), .PS2C(PS2KeyboardClk), .PS2D(PS2KeyboardData), .xkey(xkey));

endmodule
