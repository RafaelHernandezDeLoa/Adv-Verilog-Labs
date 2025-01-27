module chu_i2c_core //I made this the Pmod core.
   (
    input  logic clk,
    input  logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    // external signal    
    output tri scl,
    inout  tri sda,
    output logic SS,
    input logic IRQ
   );

   // signal declaration
   logic [15:0] dvsr_reg;
   logic wr_i2c, wr_dvsr;
   logic [7:0] dout;
   logic ready, ack; 
   
   // instantiate spi controller
   i2c_master i2c_unit   //note: won't need to change this module to accomidate with the Pmod
   (
    .din(wr_data[7:0]), .cmd(wr_data[10:8]),
    .dvsr(dvsr_reg), .done_tick(), .*
   );
       
   // registers
   always_ff @(posedge clk, posedge reset)
      if (reset)
        dvsr_reg <= 0;
      else   
         if (wr_dvsr)
             dvsr_reg <= wr_data[15:0];
   // decoding
   assign wr_dvsr = cs & write & addr[1:0]==2'b01;
   assign wr_i2c  = cs & write & addr[1:0]==2'b10;
   assign SS = ~(cs & write & addr[1:0] == 2'b11);
   // read data  
   assign rd_data = {21'b0, IRQ, ack, ready, dout};
endmodule  


