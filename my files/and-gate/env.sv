class env;
agent agt;
scoreboard sbd;
  
  mailbox#(trans)gen2drv;
mailbox#(trans)mon2sbd;
mailbox#(trans)mon2cov;
  
function new(virtual intrf vif);
gen2drv=new();
mon2sbd=new();
mon2cov=new();

  agt=new(vif,gen2drv,mon2sbd,mon2cov);
  sbd=new(mon2sbd);
endfunction

task run();
fork
agt.run();
sbd.run();
join_none
endtask
endclass
