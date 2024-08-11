module ROM (
    input wire load_en,
    output reg [7:0] data_out
);

    reg [7:0] mem [31:0]; // 256 registers, each 8 bits wide
    reg [4:0] addr = 5'b0; // Address width changed to 8 bits

	 
	 initial begin
		  mem[0]  = 8'b00000000;
		  mem[1]  = 8'b00000001;
		  mem[2]  = 8'b00000010;
		  mem[3]  = 8'b00000100;
		  mem[4]  = 8'b00001000;
		  mem[5]  = 8'b00010000;
		  mem[6]  = 8'b00100000;
		  mem[7]  = 8'b01000000;
		  mem[8]  = 8'b10000000;
		  
		  mem[9]  = 8'b10000000;
		  mem[10] = 8'b01000000;
		  mem[11] = 8'b00100000;
		  mem[12] = 8'b00010000;
		  mem[13] = 8'b00001000;
		  mem[14] = 8'b00000100;
		  mem[15] = 8'b00000010;
		  mem[16] = 8'b00000001;
		  mem[17] = 8'b00000000;

		  mem[18] = 8'b00010000;
		  mem[19] = 8'b00111000;
		  mem[20] = 8'b01111100;
		  mem[21] = 8'b11111110;
		  mem[22] = 8'b11111111;
		  mem[23] = 8'b00000000;

		  
		  mem[24] = 8'b11111111;
		  mem[25] = 8'b11111110;
		  mem[26] = 8'b01111100;
		  mem[27] = 8'b00010000;
		  mem[28] = 8'b11111111;
		  mem[29] = 8'b00000000;
		  mem[30] = 8'b10101010;
		  mem[31] = 8'b01010101;
	end	  
	 
	 always @(negedge load_en) 
	 begin
		  if (addr < 5'd31)
		  begin
				addr <= addr + 5'b1;
		  end
		  else begin
				addr <= 5'b0;
		  end
			  
	     data_out <= mem[addr];
    end

endmodule
