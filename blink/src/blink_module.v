module blink #(parameter counts_1Hz = 50000000)
(
    input wire clk,
    output wire LED);

reg [31:0] counter;
reg LED_status;

initial begin
    counter <= 32'b0;
    LED_status <= 1'b0;
end

always @ (posedge clk) begin
    counter <= counter + 1'b1;
    if (counter == counts_1Hz - 1) begin
        LED_status <= !LED_status;
        counter <= 32'b0;
    end
end
assign LED = LED_status;
endmodule
