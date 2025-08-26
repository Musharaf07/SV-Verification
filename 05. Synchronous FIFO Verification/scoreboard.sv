//Scoreboard Class
class scoreboard #(parameter DATA_WIDTH = 16);

  transaction #(DATA_WIDTH) tr;
  mailbox m2s;
  event s2g;
  bit [DATA_WIDTH-1:0] q1[$];
  int count;

  function new(mailbox m2s, event s2g);
    this.m2s = m2s;
    this.s2g = s2g;
  endfunction

  task run();
    tr = new();
    count = 0;
    forever begin
      m2s.get(tr);
      tr.display("Scoreboard");
      
     
      if (tr.wr_en)
        q1.push_back(tr.din);

      if (tr.rd_en) begin
        if (q1.size() == 0)
          $display("Reading from empty queue");
        else begin
          bit [DATA_WIDTH-1:0] expected = q1.pop_front();
          if (expected !== tr.dout)
            $display("Mismatch! Expected: %0d, Got: %0d", expected, tr.dout);
          else
            $display("Match! Data: %0d", tr.dout);
        end
      end
      
      $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

      ->s2g;
      count++;
      if (count >= 20)
        $finish;
    end
  endtask

endclass
