module counter(out, clk, reset);

  parameter WIDTH = 8;

  output [WIDTH-1 : 0] out;
  input              clk, reset;

  reg [WIDTH-1 : 0]   out;
  reg [WIDTH-1 : 0]   negcnt;
  wire               clk, reset;

  always @(posedge clk or posedge reset)
    if (reset) begin
      out <= 0;
      negcnt <= 7;
    end else begin
      out <= out + 1;
      negcnt <= negcnt - 1;
    end

endmodule // counter
