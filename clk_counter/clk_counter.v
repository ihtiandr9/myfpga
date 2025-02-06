module counter(
  output wire [WIDTH-1 : 0]   out,
  input wire clk,
  input wire reset);

  parameter WIDTH = 8;

  reg [WIDTH-1 : 0]   cnt;
  wire [WIDTH-1 : 0]   neg;
  wire [WIDTH-1 : 0]   cma;

  assign out = cnt;
  assign neg = ~out;
  assign cma = neg + 1;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      cnt <= 0;
//      assign out = neg;
    end else begin
      cnt <= cnt + 1;
//      assign out = cnt;
    end
  end

endmodule // counter
