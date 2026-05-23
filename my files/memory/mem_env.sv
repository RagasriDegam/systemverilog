class mem_env;
mem_tx tx;
mem_agent agent;
mem_sbd sbd;
	task run();
//	$display("env function is happened");
	agent=new();
	sbd=new();
	fork
	agent.run();
	sbd.run();
	join
endtask
endclass
