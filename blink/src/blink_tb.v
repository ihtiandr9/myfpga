    `timescale 10ns/1ns
module test;
  /* Make a reset that pulses once. */
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test.led1);
    # 500000000 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  blink b1 (clk, led1);

endmodule // test
