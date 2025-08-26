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
  forever begin
    tr = new();
    @(posedge vif.clk)
  #10;
  tr.wr_en  = vif.wr_en;
  tr.rd_en  = vif.rd_en;
  tr.din    = vif.din;
  tr.dout   = vif.dout;
  tr.empty  = vif.empty;
  tr.full   = vif.full;

  m2s.put(tr);
    tr.display("Monitor");
  end
endtask

endclass
