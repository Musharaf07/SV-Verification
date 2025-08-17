//Interface
interface intf #(parameter addr = 3, parameter data = 4);
  logic clk, rst, wr;
  logic [addr-1:0] addrs;
  logic [data-1:0] din;
  logic [data-1:0] dout;
endinterface
