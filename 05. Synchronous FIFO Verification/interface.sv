//Interface
interface intf #(parameter DATA_WIDTH =16);
  logic clk, rst, wr_en, rd_en;
  logic [DATA_WIDTH-1:0] din;
  logic [DATA_WIDTH-1:0] dout;
  logic empty, full;
endinterface
