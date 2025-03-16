module uart(
  output reg [WIDTH-1 : 0] recv,
  input wire clk50,
  input wire rxd);

  localparam WIDTH = 8;
  localparam WAIT = 0;          // state waiting transmit
  localparam STARTRECV = 1;     // state start receive
  localparam RECVBITS = 2;      // state while receive
  parameter HALF_BIT_TICS = 217;     // length of bit signal in clk
                                // default for 50MHz clk with bitrate 115200
  localparam BIT_TICS = 2 * HALF_BIT_TICS;

  reg  [ 9 : 0] cnt;
  reg  [ WIDTH : 0] rcv_stream;
  wire [ 9 : 0] cnt_bus;
  reg  [2 : 0] state;
  reg  [3 : 0] rcv_remain;

  assign cnt_bus = cnt;

  always @(posedge clk50) begin
    recv <= rcv_stream[WIDTH : 1];
    cnt <= cnt + 1;
    case(state)
      WAIT:  if (rxd == 0) begin
        state <= state + 1;
        cnt <= 0;
      end
      STARTRECV:  if (cnt == BIT_TICS + HALF_BIT_TICS - 1) begin
        rcv_stream <= { 8'b0000000, rxd};
        cnt <= 0;
        state <= state + 1;
        rcv_remain <= 8;
      end
      RECVBITS:  if (rcv_remain) begin
        if (cnt == BIT_TICS - 1 ) begin
          rcv_stream <= { rcv_stream[7:0], rxd};
          cnt <= 0;
          rcv_remain <= rcv_remain - 1;
        end 
      end else state <= 0;
    endcase
  end
  
  initial begin
    rcv_stream <= 0;
    recv <= rcv_stream[WIDTH : 1];
    cnt <= 0;
    state <= 0;
  end
endmodule // uart
