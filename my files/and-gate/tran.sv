class trans ;
rand bit[3:0] a;
  rand bit [3:0]b;
  bit[3:0] c;

function void print(string name);
$display("%0t-->[%s] a=%0b b=%0b c=%0b",$time,name,a,b,c);
endfunction

endclass
