class coverage;
trans tx;
mailbox#(trans)mon2cov;
covergroup cg;
coverpoint tx.a;
coverpoint tx.b;
  cross tx.a,tx.b;
endgroup

function new(mailbox#(trans)mon2cov);
this.mon2cov=mon2cov;
cg=new();
endfunction

task run();
forever begin
mon2cov.get(tx);
cg.sample();
tx.print("cov");
end
endtask
endclass

