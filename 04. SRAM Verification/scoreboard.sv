//Scoreboard
class scoreboard #(parameter addr = 3, data = 4);

  transaction #(addr,data)  tr;
  mailbox m2s;
  event s2g;
  bit [data-1:0] temp_mem [(1<<addr)-1:0];
  int pass_ct = 0;
  int fail_ct = 0;

  function new(mailbox m2s, event s2g);
    this.m2s = m2s;
    this.s2g = s2g;
  endfunction

  task run();
    tr = new();
    forever begin
      m2s.get(tr);
      tr.display("SCOREBOARD");

      if (tr.rst) begin
        foreach (temp_mem[i]) 
          temp_mem[i] = 0;
      end
      else if (tr.wr) begin
        temp_mem[tr.addrs] = tr.din;
        $display("WRITE: addr=%0b data=%0b", tr.addrs, tr.din);
      end
      else begin
        if (tr.dout === temp_mem[tr.addrs]) begin
          $display("Pass");
          pass_ct++;
        end
        else begin
          $display("Fail");
          fail_ct++;
        end
      end

      ->s2g;
     report();
    end
     
  endtask

  function void report();
    $display(" Test Report");
    $display(" Pass Count: %0d, Fail Count: %0d", pass_ct, fail_ct);
  endfunction

endclass
