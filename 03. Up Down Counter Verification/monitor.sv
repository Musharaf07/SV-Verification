//Monitor class
class monitor;
  virtual intf vif;
  mailbox m2s;
  transaction tr;
  
  function new(virtual intf vif, mailbox m2s);
    this.vif = vif;
    this.m2s = m2s;
  endfunction
  
  task run();
    forever
      begin
        tr = new();
        @(posedge vif.clk);
        #1;
        tr.clk = vif.clk;
        tr.rst = vif.rst;
        tr.d   = vif.d;
        tr.cnt   = vif.cnt;
        
        m2s.put(tr);
        tr.display("Monitor");
        
      end
  endtask
endclass
