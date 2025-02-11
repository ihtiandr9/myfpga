module uart(
  output reg [WIDTH-1 : 0] recv,
  input wire clk50,
  input wire rxd);

  parameter WIDTH = 8;
  parameter WAIT = 0;
  parameter STARTRECV = 1;
  parameter RECVBITS = 2;
  parameter BIT_TICS = 434; // 434 tics when clk 50MHz and Bitrate = 115200 Baud

  reg  [ 9 : 0] cnt;
  wire [ 9 : 0] cnt_bus;
  reg  [2 : 0] state;
  reg  [2 : 0] rcv_remain;

  assign cnt_bus = cnt;

  always @(posedge clk50) begin
    case(state)
      WAIT:  if (rxd == 0) begin
        state <= state + 1;
        cnt <= 0;
      end
      STARTRECV:  if (cnt == BIT_TICS + BIT_TICS / 2 - 1) begin
        recv <= { 7'b0000000, rxd};
        cnt <= 0;
        state <= state + 1;
        rcv_remain <= 7;
      end
      RECVBITS:  if (rcv_remain) begin
        if (cnt == 434 - 1 ) begin
          recv <= { recv[6:0], rxd};
          cnt <= 0;
          rcv_remain <= rcv_remain - 1;
        end 
      end else state <= 0;
    endcase
    cnt <= cnt + 1;
  end
  
  initial begin
    cnt = 0;
    state = 0;
  end
endmodule // uart
