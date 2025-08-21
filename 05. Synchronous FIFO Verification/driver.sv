//Driver Class
class driver;
  virtual intf vif;
  mailbox g2d;
  transaction tr;
  
  function new (virtual intf vif, mailbox g2d);
    this.vif = vif;
    this.g2d = g2d; 
  endfunction
  
  task run();
    forever
      begin
      g2d.get(tr);
      @(posedge vif.clk);
      vif.wr_en <= tr.wr_en;
      vif.rd_en <= tr.rd_en;
      vif.din <= tr.din;
      tr.display("Driver");
    end
  endtask
endclass
