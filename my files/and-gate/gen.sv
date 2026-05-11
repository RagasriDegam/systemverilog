class generator;
  mailbox#(trans)gen2drv;

function new(mailbox#(trans)gen2drv);
 this.gen2drv=gen2drv;
 endfunction

 task run();
 trans tx;
 repeat(5)begin
 tx=new();
   tx.randomize();
 tx.print("gen");
 gen2drv.put(tx);
 end
 endtask

 endclass

