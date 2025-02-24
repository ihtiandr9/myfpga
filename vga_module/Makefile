PROJECT=vga

all: test.vcd 

test.vcd: ${PROJECT}.vvp
	./${PROJECT}.vvp

${PROJECT}.vvp: ${PROJECT}_tb.v ${PROJECT}_module.v
	iverilog -o ${PROJECT}.vvp ${PROJECT}_tb.v ${PROJECT}_module.v

view: test.gtkw test.vcd
	gtkwave test.gtkw&

clean:
	rm *.vvp *.vcd
