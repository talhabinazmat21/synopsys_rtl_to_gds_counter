`timescale 1ns/1ps
module tb_counter_4bit;

    // Testbench signals
    logic clk;        // Clock signal
    logic rst_n;       // Asynchronous active-low reset
    logic dir;         // Direction signal: 1 for up, 0 for down
    logic [3:0] count; // 4-bit counter output

    // Instantiate the counter module
    counter_4bit uut (
        .clk(clk),
        .rst_n(rst_n),
        .dir(dir),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk; // Generate a clock with a period of 10 time units

    // Testbench process
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        dir = 1; // Start with counting up
        #10;     // Wait for 10 time units

        // Deassert reset to start counting
        rst_n = 1;
        #50;     // Run the counter for 50 time units

        // Change direction to count down
        dir = 0;
        #50;     // Run the counter for 50 time units

        // Assert reset to reset the counter
        rst_n = 0;
        #10;     // Hold reset for 10 time units

        // Deassert reset again and change direction to count up
        rst_n = 1;
        dir = 1;
        #50;     // Run the counter for additional 50 time units

        // Finish the simulation
        $finish;
    end

    // Monitor signals to observe the counter behavior
    initial begin
        $monitor("Time: %0t | clk: %b | rst_n: %b | dir: %b | count: %b", $time, clk, rst_n, dir, count);
    end

endmodule

