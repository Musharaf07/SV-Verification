//Scoreboard
class scoreboard;
  int pass_ct = 0;
  int fail_ct = 0;
  bit [3:0] prev_ct = 4'd0;
  mailbox m2s;
  transaction tr;
  event s2g;

  function new(mailbox m2s, event s2g);
    this.s2g = s2g;
    this.m2s = m2s;
  endfunction

  task run();
    tr = new();
    forever begin
      m2s.get(tr);
      tr.display("Scoreboard");

      if (tr.rst == 1) begin 
        prev_ct = 0;
      end else begin
        if (tr.d) prev_ct = prev_ct + 1;
        else      prev_ct = prev_ct - 1;
      end

      if (prev_ct == tr.cnt)
        begin
        $display("PASS");
        pass_ct++;
      end else begin
        $display("FAIL");
        fail_ct++;
      end
      ->s2g;
      report();
    end
  endtask

  function void report();
    $display("Pass Count: %0d, Fail Count: %0d", pass_ct, fail_ct);
  endfunction
endclass
