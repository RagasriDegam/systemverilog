class trans;
rand bit[3:0] a;
rand bit[3:0] b;
rand bit[3:0] sum;
bit carry;

function void print(string name);
$display("%0t->[%0s] a=%b b=%b sum=%b carry=%b",$time,name,a,b,sum,carry);
endfunction
endclass

