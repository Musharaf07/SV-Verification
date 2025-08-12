//Transaction Class
class transaction;
  	   bit clk;
  rand bit rst;
  rand bit d;
  	   bit q;
  
  
  function void display(string st);
    $display("-------------%s-------------",st);
    $display("%0t clk = %b, rst = %b, d = %b, q = %b",
               $time,clk, rst, d, q);

  endfunction
endclass
