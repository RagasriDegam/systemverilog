class agent;

generator gen;
bfm bfm1;
monitor mon;
cov cov1;

  function new(virtual intrf vif,
               mailbox#(trans)gen2bfm,
  				mailbox#(trans)mon2sbd,
  				mailbox#(trans)mon2cov
);
    gen=new(gen2bfm);
    bfm1=new(vif,gen2bfm);
    mon=new(vif, mon2sbd,mon2cov);
    cov1=new(mon2cov);
endfunction

task run();
fork
gen.run;
bfm1.run;
mon.run;
cov1.run;
join
endtask
endclass
