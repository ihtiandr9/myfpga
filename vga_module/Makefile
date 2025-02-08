all: test.vcd 

test.vcd: vga_module.vvp
	./vga_module.vvp

vga_module.vvp: vga_tb.v vga_module.v _build.sh
	./_build.sh

view: test.gtkw test.vcd
	gtkwave test.gtkw&

clean:
	rm *.vvp *.vcd
