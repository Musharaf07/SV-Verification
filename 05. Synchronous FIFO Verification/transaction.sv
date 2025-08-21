//Transaction Class
class transaction #(parameter DATA_WIDTH = 16);
  bit clk, rst;
  rand bit wr_en, rd_en;
  rand bit [DATA_WIDTH- 1 : 0] din;
  bit [DATA_WIDTH - 1 : 0] dout;
  bit empty, full;
  
  function void display(string st);
    $display("-----%s-----",st);
    $display("%0t wr_en=%0b rd_en=%0b data_in=%0d data_out=%0d, empty=%0d, full=%0d ", $time, wr_en, rd_en, din, dout, empty, full);
  endfunction
endclass
