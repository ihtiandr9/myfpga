    `timescale 10ns/1ns
module test;
  /* Make a reset that pulses once. */
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test);
    # 50 $finish;
  end

  /* Make a regular pulsing clock. */
  reg [1:0] sel = 2'b00;
  wire [3:0] led;
  reg sig = 1;
  reg clk = 1;

  always #1 begin
    sel = sel + 1;
    clk = !clk;
  end

  demux2 d (sel, sig, led);

endmodule // test
