class mem_agent;
mem_tx tx;
mem_gen gen;
mem_bfm bfm;
mem_mon mon;
mem_cov cov;
	task run();
//	$display("agent function will be happend");
	gen=new();
	bfm=new();
	mon=new();
	cov=new();
	fork
	gen.run();
	bfm.run();
	mon.run();
	cov.run();
	join
endtask
endclass
