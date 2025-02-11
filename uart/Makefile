all: test.vcd 

test.vcd: uart.vvp
	./uart.vvp

uart.vvp: uart_testbench.v uart.v _build.sh
	./_build.sh

view: test.gtkw test.vcd
	gtkwave test.gtkw&

clean:
	rm *.vvp *.vcd
