module counter(out, clk, reset);

  parameter WIDTH = 8;

  output [WIDTH-1 : 0] out;
  input              clk, reset;

  wire [WIDTH-1 : 0]   out;
  wire               clk, reset;

  reg [WIDTH-1 : 0]   cnt;
  assign out = cnt;

  wire [1 : 0]   tmp;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      cnt <= 0;
//      tmp <= 2'b00';
    end else begin
      cnt <= cnt + 1;
//      tmp <= 2'b01';
    end
  end

endmodule // counter
