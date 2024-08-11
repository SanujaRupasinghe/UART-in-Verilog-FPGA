`timescale 1ns / 1ps

// in here better to use (1/115200)/2 ns insted of #10
// to consider real transmittion bit duration 

module transmitter_tb;

    // Inputs
    reg [7:0] data_in;
    reg wr_en;
    reg clk_50m;
    reg clken;

    // Outputs
    wire Tx;
    wire Tx_busy;

    // Instantiate the unit under test (UUT)
    transmitter uut (
        .data_in(data_in),
        .wr_en(wr_en),
        .clk_50m(clk_50m),
        .clken(clken),
        .Tx(Tx),
        .Tx_busy(Tx_busy)
    );

    // Clock generation
    always #10 clk_50m = ~clk_50m;

    // Stimulus
    initial begin
        // Initialize inputs
        data_in = 8'h55; 
        wr_en = 0;
        clken = 0;
        clk_50m = 0;

  
        wr_en = 1;
        #20;
        wr_en = 0;
        clken = 1;
        #200;
        clken = 0;

		  #100;
		  /////////////////	
		  data_in = 8'hC9; 
        wr_en = 0;
        clken = 0;

  
        wr_en = 1;
        #20;
        wr_en = 0;
        clken = 1;
        #200;
        clken = 0;

		  #100;
		  /////////////////	
		  data_in = 8'hAE; 
        wr_en = 0;
        clken = 0;

  
        wr_en = 1;
        #20;
        wr_en = 0;
        clken = 1;
        #200;
        clken = 0;

		  #100;
		  /////////////////	
        
		  
//        // Stop simulation
//        #1000;
//        $finish;
    end
	 
//	 always @(posedge )

endmodule





