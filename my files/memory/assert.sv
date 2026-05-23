module mem_assert(clk,rst,wr_rd,addr,wdata,rdata,valid,ready);
input clk,rst,wr_rd,valid,ready;
input [`ADDR_WIDTH-1:0]addr;
input [`WIDTH-1:0]wdata,rdata;

	property reset;
	@(posedge clk)(rst==1) |->(wr_rd==0 && addr==0 && wdata==0 && rdata==0 && valid==0 && ready==0);
	endproperty
	assert property(reset);

	property preset;
	@(posedge clk)(rst==0) |->(!($isunknown(wr_rd)))&&(!($isunknown(addr)))&&(!($isunknown(wdata)))&&(!($isunknown(rdata)))&&(!($isunknown(valid)))&&(!($isunknown(ready)));
	endproperty
	assert property(preset);

   property handshaking;
	@(posedge clk)(valid==1) |->(ready==1);
	endproperty
	assert property(handshaking);

	property writes;
	@(posedge clk)(wr_rd==1) |->(!($isunknown(addr))) &&(!($isunknown(wdata)));
	endproperty
	assert property(writes);

	property reads;
	@(posedge clk)disable iff (rst==1)(wr_rd==0) |->(!($isunknown(addr))) &&(!($isunknown(rdata)));
	endproperty
	assert property(reads);

	property valid_ready;
	@(posedge clk)(valid && ready) |->(!($isunknown(wr_rd)));
	endproperty
	assert property(valid_ready);
endmodule


