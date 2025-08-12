
// Scoreboard Class
class scoreboard;
  int pass_ct = 0;
  int fail_ct = 0;
  mailbox m2s;
  event sb2gr;
  transaction trans;

  function new(mailbox m2s, event sb2gr);
    this.sb2gr = sb2gr;
    this.m2s = m2s;
  endfunction

  task run();
    for (int i = 1; i <= 20; i++) begin
      m2s.get(trans);
      trans.display("Scoreboard");

      if (trans.rst && trans.q == 0)begin
        $display("Pass");
        pass_ct++;
      end
      else if (!trans.rst && trans.q == trans.d) begin
        $display("Pass");
        pass_ct++;
    end
      else begin
        $display("Fail");
        fail_ct++;
      end
      
    ->sb2gr;
    end
    report();
  endtask

  function void report();
    $display("Pass Count: %0d, Fail Count: %0d", pass_ct, fail_ct);
  endfunction
endclass
