module dff_tb;
reg clk,rst,set,en;
reg [7:0] d;
wire [7:0] q;
dff dut(clk,rst,set,en,d,q);

initial
begin
clk=0;
forever #10 clk=~clk;
end

initial
begin
rst=1;
set=0;
en=0;
d=0;
#20;

set=1;
rst=0;
en=1;
d=1;
#20;

set=0;
rst=0;
en=1;
d=0;
#20;

set=0;
rst=0;
en=1;
d=0;
#20;

set=0;
rst=0;
en=1;
d=1;
#20;

set=1;
rst=0;
en=0;
d=1;
#20;

set=0;
rst=1;
en=1;
d=1;
#20;

$finish;
end

endmodule