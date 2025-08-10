//Driver Class
class driver;
  virtual intf vintf;
  mailbox gen2driv;
  transaction trans;
  
  function new (virtual intf vintf, mailbox gen2driv);
    this.vintf = vintf;
    this.gen2driv = gen2driv;
  endfunction
  
  task run();
    for (int i = 1; i < 9; i++)
      begin
 
      gen2driv.get(trans);
      vintf.a <= trans.a;
      vintf.b <= trans.b;
      vintf.cin <= trans.cin;
      
      #5;
      
      trans.display(" Driver");
         $display("a = %b, b = %b, cin = %b",trans.a,trans.b,trans.cin);
    end
  endtask
endclass
