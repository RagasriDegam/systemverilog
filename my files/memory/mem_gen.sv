class mem_gen;
	mem_tx tx,temp,txQ[$];

	task run();
//	$display("generator function will be happende");
case(mem_comman::test_name)
	"1WR":begin
	mem_comman::gen_count=1;
     tx=new();
     assert(tx.randomize() with{tx.wr_rd==1;})
     tx.print("mem_gen");
	 mem_comman::gen2bfm.put(tx);
	 end
	 "5WR":begin
	mem_comman::gen_count=5;
     tx=new();
	 repeat(5)begin
     assert(tx.randomize() with{tx.wr_rd==1;})
     tx.print("write mem_gen");
	 temp=new tx;
	 mem_comman::gen2bfm.put(temp);
	 end
	 end
	"1WR_1RD":begin
	mem_comman::gen_count=2;
	//wr_tx
     tx=new();
     assert(tx.randomize() with{tx.wr_rd==1;});
     temp=new tx;
	 mem_comman::gen2bfm.put(tx);
    tx.print("mem_gen_wr_tx");

	//rd_tx
     tx=new();
     assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
	 mem_comman::gen2bfm.put(tx);
	 tx.print("mem_gen_rd_tx");
	 end

	 "5WR_5RD":begin
	mem_comman::gen_count=10;
	//wr_tx
     tx=new();
	repeat(5)begin
    assert( tx.randomize() with{tx.wr_rd==1;});
	temp=new tx;
	 mem_comman::gen2bfm.put(temp);
	txQ.push_back(temp);
     tx.print("mem_gen_wr_tx");
	end
	
	//rd_tx
	repeat (5)begin
     tx=new();
	 temp=txQ.pop_front();
     assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
	 mem_comman::gen2bfm.put(tx);
	 tx.print("mem_gen_rd_tx");
	 end
	 end
	 "NWR_NRD":begin
	mem_comman::gen_count=2*mem_comman::N;
	 //wr_tx
     tx=new();
	repeat(mem_comman::N)begin
     assert(tx.randomize() with{tx.wr_rd==1;});
	temp=new tx;
	 mem_comman::gen2bfm.put(temp);
	txQ.push_back(temp);
     tx.print("mem_gen_wr_tx");
	end
	
	//rd_tx
	repeat (mem_comman::N)begin
     tx=new();
	 temp=txQ.pop_front();
     assert(tx.randomize() with{tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
	 temp=new tx;
	 mem_comman::gen2bfm.put(tx);
	 tx.print("mem_gen_rd_tx");
	 end
	 end
default :$display("//");
	 endcase
	endtask
endclass
