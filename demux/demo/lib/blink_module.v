module blink (
  input wire clk,
  output wire led);

parameter counts_1Hz = 50000000;

  reg [31:0] counter;
  reg LED_status;

  initial begin
    counter <= 32'b0;
    LED_status <= 1'b0;
  end

  always @ (posedge clk) begin
    counter <= counter + 1'b1;
    if (counter > counts_1Hz) begin
      LED_status <= !LED_status;
      counter <= 32'b0;
    end
  end
    assign led = LED_status;
endmodule
