`timescale 1ns/1ps
module counter_4bit(input logic clk, input logic rst_n, input logic dir, output logic [3:0]count);
always_ff @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		count <= 4'b0000;
		end
	else if (dir == 1'b1) begin
		count <= count + 1'b1;
		end
	else if (dir == 1'b0) begin
		count <= count - 1'b1;
		end
	end

endmodule
