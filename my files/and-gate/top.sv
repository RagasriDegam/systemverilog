`include "andgate.v"
`include "intrf.sv"
`include "tran.sv"
`include "gen.sv"
`include "drv.sv"
`include "mon.sv"
`include "cov.sv"
`include "agent.sv"
`include "sbd.sv"
`include "env.sv"



module top;
  intrf vif();
and_gate dut(
	.a(vif.a),
	.b(vif.b),
	.c(vif.c));

	env e;

initial begin
vif.clk=0;
forever begin
#5 vif.clk=~vif.clk;
end
end


initial begin
  //env e;
  e = new(vif);
e.run();
  #100;
$finish;
end
endmodule



