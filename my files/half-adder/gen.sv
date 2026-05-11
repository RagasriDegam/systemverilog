class generator;

mailbox #(trans)gen2bfm;
//virtual intrf vif;

  function new(mailbox#(trans)gen2bfm);
    this.gen2bfm=gen2bfm;
endfunction

  task run();
    trans tx;
    repeat(5)begin
tx=new();
tx.randomize();
tx.print("gen");
gen2bfm.put(tx);
end
endtask
endclass

