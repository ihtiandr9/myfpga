module demux2 (
  input wire [1:0] selector,
  input wire signal,
  output reg [3:0] port);

  initial begin
    port <= 4'bzzzz;
  end

  always @(*) begin
    case(selector)
      0:begin
        port <= {3'bzzz, signal};
      end
      1:begin
        port <= {2'bzz, signal,1'bz};
      end
      2:begin
        port <= {1'bz,signal, 2'bzz};
      end
      3:begin
        port <= {signal, 3'bzzz};
      end
    endcase
  end

endmodule
