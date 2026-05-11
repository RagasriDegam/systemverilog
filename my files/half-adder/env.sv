class env;
mailbox#(trans)gen2bfm;
mailbox#(trans)mon2sbd;
mailbox#(trans)mon2cov;

agent agt;
scoreboard sbd;


  function new(virtual intrf vif);
    gen2bfm=new();
    mon2sbd=new();
    mon2cov=new();
    agt=new(vif,gen2bfm,mon2sbd,mon2cov);
    sbd=new(mon2sbd);
endfunction

task run();
fork
agt.run;
sbd.run;
join
endtask
endclass
