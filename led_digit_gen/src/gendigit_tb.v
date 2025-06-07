    `timescale 10ns/1ns
module test;

  /* Make a reset that pulses once. */
  initial begin
    en = 0;
    code = 0;
    $dumpfile("test.vcd");
    $dumpvars(0, test);
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 begin
      en = 1;
      code = 0;
     end
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 1 code = code + 1;
     # 5 $finish;
  end

  /* Make a regular pulsing clock. */
  reg en;
  reg [3:0] code;
  wire [7:0] seg;
  gendigit_module gen (en, code, seg);

  initial
     $monitor("At time %t, value = %h (%0d)",
              $time, seg, seg);
endmodule // test
