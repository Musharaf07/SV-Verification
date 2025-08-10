//Transaction Class
class transaction;
  rand bit a, b;
  randc bit cin;
  	   bit sum, cout;
  
  constraint con1{(a==1);}
  constraint con2{b dist {1:=50, 0:=50};}
  
  function void display(string st);
    $display("-------------%s-------------",st);
  endfunction
endclass
