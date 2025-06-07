module gendigit_module(
  input wire en,
  input wire [3 : 0] code,
  output reg [WIDTH-1 : 0] seg);

  parameter WIDTH = 8;

  always @(*) begin
    case(code)
      0:  seg = 8'b11000000;
      1:  seg = 8'b11111001;
      2:  seg = 8'b10100100;
      3:  seg = 8'b10110000;
      4:  seg = 8'b10011001;
      5:  seg = 8'b10010010;
      6:  seg = 8'b10000010;
      7:  seg = 8'b11111000;
      8:  seg = 8'b10000000;
      9:  seg = 8'b10010000;
      10:  seg = 8'b10001000;
      11:  seg = 8'b10000011;
      12:  seg = 8'b10100111;
      13:  seg = 8'b10100001;
      14:  seg = 8'b10000110;
      15:  seg = 8'b10001110;
    endcase
    if(en == 1) seg = 8'bzzzzzzzz;
  end
  
endmodule // gendigit_module