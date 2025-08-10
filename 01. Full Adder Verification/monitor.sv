//Monitor Class
class monitor;
  virtual intf vintf;
  mailbox mntr2scb;
  transaction trans;
  
  function new(virtual intf vintf, mailbox mntr2scb);
    this.vintf = vintf;
    this.mntr2scb = mntr2scb;
  endfunction
  
  task run();
    for (int i = 1; i < 9; i++)
       begin
      #5;
      trans = new();
      trans.a = vintf.a;
      trans.b = vintf.b;
      trans.cin = vintf.cin;
      trans.sum = vintf.sum;
      trans.cout = vintf.cout;
      
      mntr2scb.put(trans);
      
      trans.display("Monitor");
       $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b",trans.a,trans.b,trans.cin,trans.sum,trans.cout);
    end
  endtask
endclass
