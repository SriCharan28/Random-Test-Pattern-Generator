module wrpg_tb;
reg set,rst,en,clk;
reg [7:0] D,cin;
wire [7:0] cout;

wrpg dut(D,cin,cout,set,rst,en,clk,Y);

initial
begin
clk=0;
forever #10 clk=~clk;
end

initial
begin
set=1;
rst=0;
en=1;
D=0;
cin=0;
#20;
set=1;
rst=0;
en=1;
D=0;
cin=1;
#20;
set=0;
rst=1;
en=1;
D=1;
cin=0;
#20;
set=0;
rst=1;
en=1;
D=1;
cin=1;
#20;
set=0;
rst=0;
en=1;
D=0;
cin=0;
#20;
set=0;
rst=0;
en=1;
D=1;
cin=1;
#20;
$finish;
end
endmodule
