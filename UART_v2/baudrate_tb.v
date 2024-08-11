`timescale 1ps / 1ps

module baudrate_tb;

  // Inputs
  reg clk_50m;
  
  // Outputs
  wire Rxclk_en;
  wire Txclk_en;

  // Instantiate the baudrate module
  baudrate dut (
    .clk_50m(clk_50m),
    .Rxclk_en(Rxclk_en),
    .Txclk_en(Txclk_en)
  );

  // Clock generation
  always #10 clk_50m = ~clk_50m;

  // Stimulus
  initial begin
    clk_50m = 0;

    // Add reset here if necessary

    #1000 $finish; // Finish simulation after 1000 time units
  end

  // Monitor
  always @(posedge clk_50m) 
  begin
	if (Rxclk_en == 1)
		begin
			$display("Rxclk_en: %b, Txclk_en: %b", Rxclk_en, Txclk_en);
		end
  end

endmodule
