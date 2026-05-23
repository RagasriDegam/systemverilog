module tb;
reg clk,rst;
	mem_env env;//env declaration
	mem_inter pif(clk,rst);//physical interface


     /*memory dut(.clk(pif.clk),
	 			.rst(pif.rst),
				.wr_rd(pif.wr_rd),
				.addr(pif.addr),
				.wdata(pif.wdata),
				.rdata(pif.rdata),
				.valid(pif.valid),
				.ready(pif.ready));*/
	memory dut(pif.design_mp);

 mem_assert uut(.clk(pif.clk),
	 			.rst(pif.rst),
				.wr_rd(pif.wr_rd),
				.addr(pif.addr),
				.wdata(pif.wdata),
				.rdata(pif.rdata),
				.valid(pif.valid),
				.ready(pif.ready));


	always #5 clk=~clk;

	initial begin
//	$display("mem_tb function is happened");
	clk=0;
	rst=0;
	#5;
	rst=1;
	repeat(2)@(posedge clk);
	rst=0;
	$value$plusargs("test_name=%0s",mem_comman::test_name);
	$value$plusargs("N=%0d",mem_comman::N);

	env=new();
	env.run();
	end
	initial begin
	//#20;
	//wait(mem_comman::gen_count==mem_comman::bfm_count);
	//#50;
	#2500;//increase time period to get data and transcation
	//#1500;
	if(mem_comman::matchings!=0 && mem_comman::mismatchings==0)begin
	$display("test_passed");
	$display("matchings=%0d,mismatchings=%0d",mem_comman::matchings,mem_comman::mismatchings);
	end
	else begin
	$display("test_failed");
	$display("matching=%0d,mismatchings=%0d",mem_comman::matchings,mem_comman::mismatchings);
	end
	$finish;
	end
	initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
	end

endmodule

/*# mem_tb function is happened
# env function is happened
# agent function will be happend
# bfm function will be happende
# mon function will be happend
# cov function will be happend
# sbd function happend*/
