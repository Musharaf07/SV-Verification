//SRAM
module SRAM #( parameter addr = 3, parameter data = 4)
  (input clk,
   input rst,
   input wr,
   input [addr - 1 : 0] addrs,
   input [data - 1 : 0] din,
   output reg [data - 1 : 0] dout );
  
  reg [data - 1 : 0] mem [0:(1<<addr) - 1];
  
  always@(posedge clk) begin
      if(rst) begin
        dout <= 0;
        for (int i = 0; i < (1 << addr); i++) begin
          mem[i] <= 0;
        end
      end
      else if (wr)
        mem[addrs] <= din;
      else
        dout <= mem[addrs];
    end
endmodule
