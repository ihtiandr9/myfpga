module gray2bin_always
#(parameter SIZE =4)
 (output reg [SIZE-1:0] bin,
 input [SIZE-1:0] gray);
integer i;
// Syntax Error - variable Index range
always @(gray)
 for (i=0; i<SIZE; i=i+1)
 assign bin[i] = ^gray[SIZE-1:i];
endmodule