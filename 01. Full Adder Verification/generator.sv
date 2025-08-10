//Generator Class
class generator;
  transaction trans;
  mailbox gen2driv;

  function new(mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction

  task run();
    for (int i = 0; i < 8; i++) begin
      trans = new();

      if(trans.randomize()) begin
        trans.display("Generate");
          $display("a = %b, b = %b, cin = %b",trans.a,trans.b,trans.cin);
        end

      gen2driv.put(trans);
    end
  endtask
endclass
