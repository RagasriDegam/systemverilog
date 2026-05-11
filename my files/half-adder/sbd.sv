class scoreboard;
//virtual intrf vif;
mailbox#(trans)mon2sbd;

function new(mailbox#(trans)mon2sbd);
//this.vif=vif;
this.mon2sbd=mon2sbd;
endfunction

task run();
trans tx;
bit[3:0]exp_sum;
bit[3:0]exp_carry;
forever begin
mon2sbd.get(tx);
tx.print("sbd");
exp_sum=tx.a^tx.b;
exp_carry=tx.a&tx.b;
if(tx.sum==exp_sum && tx.carry==exp_carry)
$display("pass");
else 
$display("fail");
end
endtask
endclass

