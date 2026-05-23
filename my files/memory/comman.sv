`define WIDTH 8
`define DEPTH 32
`define ADDR_WIDTH $clog2(`DEPTH)

class mem_comman;
 static string test_name="NWR_NRD";
 static int N=10;
 static mailbox gen2bfm=new();
 static mailbox mon2cov=new();
 static mailbox mon2sbd=new();
 static int matchings,mismatchings;
 static int gen_count,bfm_count;//optional 
endclass
