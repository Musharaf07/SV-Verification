//Generator Class
class generator;
  transaction trans;
  mailbox g2d;
  event sb2gr;

  function new(mailbox g2d, event sb2gr);
    this.sb2gr = sb2gr;
    this.g2d = g2d;
  endfunction

  task run();
    for (int i = 1; i <= 20; i++) begin
      trans = new();
      void'(trans.randomize());
      g2d.put(trans);
      trans.display("Generator");
      @sb2gr;
     
    end
  endtask
endclass
