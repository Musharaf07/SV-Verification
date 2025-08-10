// Scoreboard Class
class scoreboard;
  int pass_ct = 0;
  int fail_ct = 0;
  mailbox mntr2scb;
  transaction trans;
  
  function new(mailbox mntr2scb);
    this.mntr2scb = mntr2scb;
  endfunction
  
  function void report();
    $display("------ TEST REPORT ------");
    $display("Passed = %0d", pass_ct);
    $display("Failed = %0d", fail_ct);
    $display("--------------------------");
  endfunction
  
  task run();
    for (int i = 1; i < 9; i++)
      begin
        mntr2scb.get(trans);
        trans.display("Scoreboard");
        $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b",trans.a,trans.b,trans.cin,trans.sum,trans.cout);
        
        if ((trans.a ^ trans.b ^ trans.cin == trans.sum)&&((trans.a &  trans.b)|(trans.cin & trans.b)|(trans.a & trans.cin) == trans.cout))
          begin
            $display("Expected Ouput\n Pass ");
            pass_ct++;
          end
        else
          begin
            $display("fail");
            fail_ct++;
          end
      end
    report();
  endtask
  
endclass
           
