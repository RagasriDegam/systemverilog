class scoreboard;
mailbox#(trans)mon2sbd;

  function new(mailbox#(trans)mon2sbd);
this.mon2sbd=mon2sbd;
endfunction

  task run();
    trans tx;
    bit [3:0]exp;
forever begin
mon2sbd.get(tx);
  tx.print("sbd");
  exp=tx.a || tx.b;
  if(tx.c ==exp)
    $display("pass");
  else
    $display("fail");
end
    endtask
endclass
