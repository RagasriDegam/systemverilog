class mem_cov;
mem_tx tx;

	covergroup cg;
	option.per_instance=1;
	option.name="MEM_COVERAGE";
	
	WR_RD:coverpoint tx.wr_rd {
	option.weight=1;
	option.at_least=20;
			bins WRITES={1'b1};//singular variable 
			bins READS={1'b0};
			option.comment="memory wr_rd signal coverpoint";
		}
		ADDRESS:coverpoint tx.addr{
		option.weight=2;
		option.comment="memory address signal coverpoint";
		option.goal=50;
			bins AADR0={5'b00000};
			bins AADR1={5'b00001};
			bins AADR2={5'b00010};
			bins AADR3={5'b00011};
			bins AADR4={5'b00100};
			bins AADR5={5'b00101};
			bins AADR6={5'b00110};
			bins AADR7={5'b00111};
			bins AADR8={5'b01000};
			bins AADR9={5'b01001};
			bins AADR10={5'b01010};
			bins AADR11={5'b01011};
			bins AADR12={5'b01100};
			bins AADR13={5'b01101};
			bins AADR14={5'b01110};
			bins AADR15={5'b01111};
			bins AADR16={5'b10000};
			bins AADR17={5'b10001};
			bins AADR18={5'b10010};
			bins AADR19={5'b10011};
			bins AADR20={5'b10100};
			bins AADR21={5'b10101};
			bins AADR22={5'b10110};
			bins AADR23={5'b10111};
			bins AADR24={5'b11000};
			bins AADR25={5'b11001};
			bins AADR26={5'b11010};
			bins AADR27={5'b11011};
			bins AADR28={5'b11100};
			bins AADR29={5'b11101};
			bins AADR30={5'b11110};
			bins AADR31={5'b11111};

		/*	bins ADDR0={[0:3]};
			bins ADDR1={[2:7]};//overlapping of bins
			bins ADDR2={[5:11]};
			bins ADDR3={[9:15]};
			bins ADDR4={[16:19]};
			bins ADDR5={[20:23]};
			bins ADDR6={[24:27]};
			bins ADDR7={[28:31]};*/

			//bin ADDR[8]={[0:31]};//static array creation
		//	bins ADDR[]={[0:32]};//dynamic array creation
		//	bins ADDR[]={[0:32]} with (item%2==0);//dynamic arry with conditions bins creation
		option.detect_overlap=1;
		option.auto_bin_max=5;
          }

 CROSS_WR_RD_ADDR:cross WR_RD,ADDRESS {
 		option.weight=5;
 		option.comment="memory cross product of wr_rd and address signals coverpoint";
 		//	bins SAMPLE =binsof(WR_RD.WRITES);//cross coverage
 		//	bins SAMPLE1 =binsof(WR_RD.READS);//cross coverage
	//	bins SAMPLE=binsof(ADDRESS)intersect {[2:9]};
	}

	endgroup

	function new();
	cg=new();
	endfunction

	task run();
//	$display("cov function will be happend");
	forever begin
	mem_comman::mon2cov.get(tx);
	cg.sample();
	tx.print("mem_cov");
	end
	endtask
	endclass

//by commenting all the bins it means it is a implict bins creation it will automatically take bins value
