module vga(input clock, output r, output g, output b, output hs, output vs);

reg [9:0] x = 10'b0;
reg [8:0] y = 9'b0;

wire xborder = x == 10'd799;
wire yborder = y ==  9'd448;
wire visible = x >= 48 && x < 48+640 && y >= 35 && y <= 35+400;

// Горизонтальная и вертикальная синхронизация
assign hs = x  < 48+640+16;
assign vs = y >= 35+400+12;

// Вывод серого экрана
assign {r, g, b} = visible ? 3'b111 : 3'b000;

always @(posedge clock) begin

    x <= xborder ? 1'b0 : x + 1'b1;
    y <= xborder && yborder ? 1'b0 : (xborder ? y + 1'b1 : y);

end

endmodule