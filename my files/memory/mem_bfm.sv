class mem_bfm;
mem_tx tx;
virtual mem_inter vif;
	

	task run();
	vif=tb.pif;   //targeting the physical interface memory
//	$display("bfm function will be happende");
   forever begin
   mem_comman::gen2bfm.get(tx);
   drive_tx(tx);
 //  tx.print("mem_bfm");
  mem_comman::bfm_count++;
   end
	endtask


/*		//interface topic
	task drive_tx(mem_tx tx);
	@(posedge vif.clk);
	vif.wr_rd=tx.wr_rd;
	vif.addr=tx.addr;
	if(tx.wr_rd==1) vif.wdata=tx.wdata;
	else vif.wdata=0;
	vif.valid=1;
	wait(vif.ready==1);
	if(tx.wr_rd==0)begin
	@(posedge vif.clk);
	tx.rdata=vif.rdata;
	end
	else tx.rdata=0;

	@(posedge vif.clk);
	vif.wr_rd=0;
	vif.addr=0;
	vif.wdata=0;
	vif.valid=0;
	endtask
*/


	//clocking blocks
	task drive_tx(mem_tx tx);
	@(vif.bfm_mp.bfm_cb);
	vif.bfm_mp.bfm_cb.wr_rd      <=tx.wr_rd;
	vif.bfm_mp.bfm_cb.addr       <=tx.addr;
	if(tx.wr_rd==1)
	vif.bfm_mp.bfm_cb.wdata      <=tx.wdata;
	else  
	vif.bfm_mp.bfm_cb.wdata<=0;
	vif.bfm_mp.bfm_cb.valid<=1;
	wait(vif.bfm_mp.bfm_cb.ready==1);
	if(tx.wr_rd==0)begin
	@(vif.bfm_mp.bfm_cb);
	tx.rdata=vif.bfm_mp.bfm_cb.rdata;
	end
	else tx.rdata=0;

	@(vif.bfm_mp.bfm_cb);
	vif.bfm_mp.bfm_cb.wr_rd<=0;
	vif.bfm_mp.bfm_cb.addr<=0;
	vif.bfm_mp.bfm_cb.wdata<=0;
	vif.bfm_mp.bfm_cb.valid<=0;
	endtask

	endclass

	
