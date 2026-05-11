class agent;
generator gen;
driver drv;
monitor mon;
coverage cov;

  function new(virtual intrf vif,
  				mailbox#(trans)gen2drv,
  				mailbox#(trans)mon2sbd,
  				mailbox#(trans)mon2cov
				);
  gen=new(gen2drv);
  drv=new(vif,gen2drv);
    mon=new(vif,mon2sbd,mon2cov);
  cov=new(mon2cov);
endfunction

task run();
	fork
      gen.run();
	drv.run();
	mon.run();
	cov.run();
	join
endtask
endclass
