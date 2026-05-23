interface mem_inter(input reg clk,rst);
bit wr_rd;
bit [`ADDR_WIDTH-1:0]addr;
bit [`WIDTH-1:0]wdata,rdata;
bit valid,ready;

clocking bfm_cb @(posedge clk);
default input #0 output #1;
	input ready,rdata;
	output wr_rd,addr,wdata,valid;
	endclocking

	clocking mon_cb @(posedge clk);
   default input #1;
	input wr_rd,addr,wdata,valid,ready,rdata;
	endclocking

	modport design_mp(
	input clk,rst,wr_rd,addr,wdata,valid,
	output rdata,ready
	);

	modport bfm_mp(
		clocking bfm_cb
	);
endinterface
