module lfsr_tb();
reg clk,set;
wire [7:0]q;
lfsr dut(clk,set,q);

initial 
begin
	clk=0;
	forever #10 clk=~clk;
end

initial 
begin
	set=0;
	#20; 
	set=1;
	#100;
	set=0;
	#20;
	set=1;
	#10000;
	set=0;
	#20; 
	set=1;
	#100;
	$finish;
end 
endmodule