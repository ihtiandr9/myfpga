    `timescale 10ns/1ns
module test;
  /* Make a reset that pulses once. */
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test);
    # 50 $finish;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #1 clk = !clk;

  blink #(4) b1 (
      .clk(clk),
      .LED(led1)
  );

endmodule // test
