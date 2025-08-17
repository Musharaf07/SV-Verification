//Transaction Class
class transaction #(parameter addr = 3, parameter data = 4);
  bit clk;
  bit rst;
  rand bit wr;
  randc bit [addr - 1 : 0] addrs;
  rand bit [data - 1 : 0] din;
  bit [data - 1 : 0] dout;
  
  function void display(string st);
    $display("-----%s-----",st);
    $display("%0t clk = %b, rst = %b, wr = %b, addrs = %b, din = %b, dout = %b",
             $time,clk,rst,wr,addrs,din,dout);
  endfunction
endclass
