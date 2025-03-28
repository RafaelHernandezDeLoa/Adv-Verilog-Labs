`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 11:16:57 PM
// Design Name: 
// Module Name: chu_vga_sprite_lever_core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module chu_vga_sprite_lever_core
   #(parameter CD = 12,   // color depth
               ADDR_WIDTH = 10,
               KEY_COLOR = 0
   )
   (
    input  logic clk, reset,
    // frame counter
    input logic [10:0] x, y,
    // video slot interface
    input  logic cs,      
    input  logic write,  
    input  logic [13:0] addr,    
    input  logic [31:0] wr_data,
    // stream interface
    input  logic [11:0] si_rgb,
    output logic [11:0] so_rgb
   );
   
   // delaration
   logic wr_en, wr_ram, wr_reg, wr_ctrl, wr_bypass, wr_x0, wr_y0;
   logic [CD-1:0] lever_rgb, chrom_rgb;
   logic [10:0] x0_reg, y0_reg;
   logic [1:0] ctrl_reg;
   logic bypass_reg;

   // body
   // instantiate sprite generator
   lever_src #(.CD(CD), .KEY_COLOR(0)) lever_src_unit (
       .clk(clk), 
       .x(x), .y(y), 
       .x0(x0_reg), .y0(y0_reg),
       .ctrl(ctrl_reg),
       .we(wr_ram), .addr_w(addr[ADDR_WIDTH-1:0]),
       .pixel_in(wr_data[0]), 
       .lever_rgb(lever_rgb));
       
   // register  
   always_ff @(posedge clk, posedge reset)
      if (reset) begin
         x0_reg <= 0;
         y0_reg <= 0;
         bypass_reg <= 0;
         ctrl_reg <= 2'b10;
      end   
      else begin
         if (wr_x0)
            x0_reg <= wr_data[10:0];
         if (wr_y0)
            y0_reg <= wr_data[10:0];
         if (wr_bypass)
            bypass_reg <= wr_data[0];
         if (wr_ctrl)
            ctrl_reg <= wr_data[1:0];
      end      
      
   // decoding 
   assign wr_en = write & cs;
   assign wr_ram = ~addr[13] && wr_en;
   assign wr_reg = addr[13] && wr_en;
   assign wr_bypass = wr_reg && (addr[1:0]==2'b00);
   assign wr_x0 = wr_reg && (addr[1:0]==2'b01);
   assign wr_y0 = wr_reg && (addr[1:0]==2'b10);
   assign wr_ctrl = wr_reg && (addr[1:0]==2'b11);
   // chrome-key blending and multiplexing
   assign chrom_rgb = (lever_rgb != KEY_COLOR) ? lever_rgb : si_rgb;
   assign so_rgb = (bypass_reg) ? si_rgb : chrom_rgb;
   
endmodule
