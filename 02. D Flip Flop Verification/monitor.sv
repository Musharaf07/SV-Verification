//Monitor class
class monitor;
  virtual intf vintf;
  mailbox m2s;
  transaction trans;
  
  function new(virtual intf vintf, mailbox m2s);
    this.vintf = vintf;
    this.m2s = m2s;
  endfunction
  
  task run();
    for(int i = 1; i <=20; i++)
      begin
        trans = new();
        @(posedge vintf.clk);
        #1;
        trans.clk = vintf.clk;
        trans.rst = vintf.rst;
        trans.d   = vintf.d;
        trans.q   = vintf.q;
        
        
        m2s.put(trans);
        trans.display("Monitor");
        
      end
  endtask
endclass
