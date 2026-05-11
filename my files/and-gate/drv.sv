class driver;
mailbox#(trans)gen2drv;
virtual intrf vif;

function new(virtual intrf vif,
			mailbox#(trans)gen2drv);
this.vif=vif;
this.gen2drv=gen2drv;
endfunction

task run();
trans tx;
forever begin
tx=new();
  gen2drv.get(tx);
  @(posedge vif.clk);
vif.a <=tx.a;
vif.b <=tx.b;
//vif.c <=tx.c;

tx.print("drv");
end
endtask
endclass
