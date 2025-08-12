//Driver Class
class driver;
  virtual intf vintf;
  mailbox g2d;
  transaction trans;
  
  function new (virtual intf vintf, mailbox g2d);
    this.vintf = vintf;
    this.g2d = g2d; 
  endfunction
  
  task run();
    for(int i = 1; i <= 20; i++)
      begin
        g2d.get(trans);
        vintf.rst = trans.rst;
        vintf.d = trans.d;
        trans.display("Driver");       
      end
  endtask
endclass
