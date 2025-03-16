module counter(
  output reg [WIDTH-1 : 0] counter_out,
  input wire clk,
  input wire neg_reset);

  parameter WIDTH = 32;

  reg  [WIDTH-1 : 0] cnt;
  wire [WIDTH-1 : 0] neg;
  wire [WIDTH-1 : 0] cma;
  wire [WIDTH-1 : 0] cnt_bus;
  wire counter_reset = ~neg_reset;

  assign cnt_bus = cnt;
  assign neg = ~cnt_bus;
  assign cma = neg + 1;

  always @(posedge clk) begin
    case(counter_reset)
      1:  cnt <= 0;
      0:  cnt <= cnt + 1;
    endcase
  end
  
  always @(*) begin
    case(counter_reset)
      1:  counter_out = ~cnt;
      0:  counter_out = cnt;
    endcase
  end

endmodule // counter
