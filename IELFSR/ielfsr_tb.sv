/*
module lfsr_tb();
reg clk,set,S;
wire [7:0]q;
lfsr dut(clk,set,S,q);

initial 
begin
	clk=0;
	forever #5 clk=~clk;
end

initial 
begin
	set=0;
	#10; 
	set=1;
	S=0;
	#10000
	set=0;
	#10;
	set=1;
	S=1;
	#10000
	$finish;
end 
endmodule
*/
module lfsr_tb;

  // Parameters
  parameter SIM_TIME = 256; // Simulation time
  
  // Signals
  logic clk = 0;
  logic set = 0;
  logic S = 0;
  logic [7:0] q; // No initialization
  
  integer file;
  
  // Instantiate the LFSR module
  lfsr dut (
    .clk(clk),
    .set(set),
    .S(S),
    .q(q)
  );
  
  // Clock generation
  always #2 clk = ~clk;
  
  // Stimulus
  initial begin
    $dumpfile("lfsr_tb.vcd"); // Dump waveform to VCD file
    $dumpvars(0, lfsr_tb); // Dump variables
    
    // Open CSV file for writing
    file = $fopen("lfsr_output.csv", "w");
    
    // Apply reset
    
    set=0;
	#2; 
	set=1;
	S=0;
	#256
	set=0;
	#2;
	set=1;
	S=1;
	#256

    // Simulate for SIM_TIME cycles
    repeat (SIM_TIME) begin
      #1;
    end
    
    // Close CSV file
    $fclose(file);
    
    // Finish simulation
    $finish;
  end
  
  // Write output to CSV file
  always @(posedge clk) begin
    if (!$feof(file)) begin
     $fwrite(file, "%08b\n", q); // Format q to be 8 bits with leading zeros
    end
  end
  
endmodule
