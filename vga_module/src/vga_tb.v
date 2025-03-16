`timescale 10 ns / 1 ns
module test;

/* Make a reset that pulses once. */
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test);
        # 1800000 $finish;
        $monitor("At time %t, value = %h (%0d)",
            $time, VGA_B, VGA_B);
    end

    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #1 clk = !clk;

    wire [3:0] VGA_R;
    wire [3:0] VGA_G;
    wire [3:0] VGA_B;
    wire VGA_HS;
    wire VGA_VS;
    vga VGAUnit (
        .clock      (clk),
        .r          (VGA_R[3]), // Здесь VGA_R - 4х битный ЦАП
        .g          (VGA_G[3]), // Потому выход присваивается старшему разряду
        .b          (VGA_B[3]), // Чтобы был серый цвет
        .hs         (VGA_HS),
        .vs         (VGA_VS));

endmodule // test
