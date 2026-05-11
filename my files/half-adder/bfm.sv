class bfm;
mailbox#(trans)gen2bfm;
virtual intrf vif;

function new(virtual intrf vif,
			mailbox#(trans)gen2bfm);
this.vif=vif;
this.gen2bfm=gen2bfm;
endfunction

task run();
  trans tx;
forever begin
  tx=new();
gen2bfm.get(tx);
tx.print("bfm");
@(posedge vif.clk);
vif.a<=tx.a;
vif.b<=tx.b;
end
endtask
endclass


