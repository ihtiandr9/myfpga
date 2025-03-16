`timescale 10 ns / 1 ns
module test;

  /* Make a rxd that pulses once. */
  reg rxd = 1;
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test);
    # 17 rxd = 0;
    # (434 * 2) rxd = 1;
    # (434 * 2) rxd = 0;
    # (434 * 2 * 7) rxd = 1;
    # 8000 $finish;
    $monitor("At time %t, value = %h (%0d)",
      $time, echo, echo);
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  wire [7:0] echo;
  uart c1 (echo, clk, rxd);

endmodule // test
