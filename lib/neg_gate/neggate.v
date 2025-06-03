module neggate (
  input wire [WIDTH - 1:0] in,
  output wire [WIDTH - 1:0] out);
  parameter WIDTH = 3;
        assign out = ~in;
endmodule
