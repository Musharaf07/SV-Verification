//Generator Class
class generator;
  transaction tr;
  mailbox g2d;
  event s2g;
  
  function new(mailbox g2d, event s2g);
    this.s2g = s2g;
    this.g2d = g2d;
  endfunction
  
  task run();
    forever begin
      tr = new();
      if(tr.randomize()) begin
        g2d.put(tr);     
        tr.display("Generator");
      end
      @s2g;
    end
  endtask
endclass
