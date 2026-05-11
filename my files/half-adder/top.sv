`include "haldadd.v"
`include "interface.sv"
`include "tx.sv"

`include "gen.sv"
`include "bfm.sv"
`include "mon.sv"
`include "cov.sv"
`include "sbd.sv"
`include "agent.sv"
`include "env.sv"


module top;
intrf vif();

h_a dut(.a(vif.a),
		.b(vif.b),
		.sum(vif.sum),
		.carry(vif.carry));
env e;
  
initial begin
vif.clk=0;
forever begin
#5 vif.clk=~vif.clk;
end
end

initial begin
e=new(vif);

e.run();

#100;
$finish;
end
endmodule

