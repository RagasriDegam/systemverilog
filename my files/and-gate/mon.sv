class monitor;
 // int count=0;
virtual intrf vif;

mailbox#(trans)mon2sbd;
mailbox#(trans)mon2cov;

function new(virtual intrf vif,
			mailbox #(trans)mon2sbd,
 				mailbox #(trans)mon2cov);
this.vif=vif;
this.mon2sbd=mon2sbd;
this.mon2cov=mon2cov;
endfunction

task run();
trans tx;
forever begin
@(posedge vif.clk);
tx=new();
#5;
//for(count=0; count<=5; count++)begin
tx.a=vif.a;
tx.b=vif.b;
tx.c=vif.c;
mon2sbd.put(tx);
mon2cov.put(tx);
tx.print("mon");
end
endtask
endclass
