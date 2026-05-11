module and_gate(a,b,c);
input bit[3:0] a;
input bit [3:0]b;
  output bit [3:0]c;

assign c=a&b;

endmodule

