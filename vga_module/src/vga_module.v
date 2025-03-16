module vga(input clock, output r, output g, output b, output hs, output vs);

reg [9:0] x = 10'b0;
reg [8:0] y = 9'b0;

// ---------------------------------------------------------------------
// Тайминги для горизонтальной и вертикальной развертки
//           Visible       Front        Sync        Back       Whole
parameter hzv =  640, hzf =   16, hzs =   96, hzb =   48, hzw =  800,
          vtv =  400, vtf =   12, vts =    2, vtb =   35, vtw =  449;
// ---------------------------------------------------------------------

wire xborder = x == 10'd799;
wire yborder = y ==  9'd448;
wire visible = x >= hzb && x < hzb + hzv && y >= vtb  && y <= vtb + vtv;

// Горизонтальная и вертикальная синхронизация
assign hs = x  < hzb + hzv + hzf;
assign vs = y >= vtb + vtv + vtf;

// Вывод серого экрана
assign {r, g, b} = visible ? 3'b111 : 3'b000;

always @(posedge clock) begin

    x <= xborder ? 1'b0 : x + 1'b1;
    y <= xborder && yborder ? 1'b0 : (xborder ? y + 1'b1 : y);

end

endmodule