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
        tr.clk = vif.clk;
        tr.rst = vif.rst;
        tr.wr   = vif.wr;
        tr.addrs   = vif.addrs;
        tr.din   = vif.din;
        tr.dout   = vif.dout;
        
        m2s.put(tr);
        tr.display("Monitor");
        
      end
  endtask
endclass
