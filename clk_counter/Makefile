all: test.vcd 

test.vcd: clk_counter.vvp
	./clk_counter.vvp

clk_counter.vvp: clk_counter_tesbench.v clk_counter.v _build.sh
	./_build.sh

view: test.gtkw test.vcd
	gtkwave test.gtkw&

clean:
	rm *.vvp *.vcd
