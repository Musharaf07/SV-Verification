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
//         @(posedge vif.clk);
        vif.wr <= tr.wr;
        vif.addrs <= tr.addrs;
        vif.din <= tr.din;
        tr.display("Driver");
       
      end
  endtask
endclass
