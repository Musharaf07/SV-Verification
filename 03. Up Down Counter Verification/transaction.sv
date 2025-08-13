//Transaction Class
class transaction;
  bit clk;
  bit rst;
  rand bit d;
  bit [3:0] cnt;
  
  function void display(string st);
    $display("-----%s-----",st);
    $display("%0t clk = %b, rst = %b, d = %b, cnt = %d",
             $time,clk,rst,d,cnt);
  endfunction
endclass
