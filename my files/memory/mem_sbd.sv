class mem_sbd;
mem_tx tx;

	int asso[int];
	
	task run();
//	$display("sbd function happend");
	forever begin
	tx=new();
	mem_comman::mon2sbd.get(tx);
	tx.print("mem_sbd");
	if(tx.wr_rd==1) 
		asso[tx.addr]=tx.wdata;
	else begin
		if(asso[tx.addr]==tx.rdata)
		mem_comman::matchings++;
		else mem_comman::mismatchings++;
	end
	end
	endtask
	endclass
