all: test.vcd 

test.vcd: grey2bin.vvp
	./grey2bin.vvp

grey2bin.vvp: grey2bin.v _build.sh
	./_build.sh

view: test.gtkw test.vcd
	gtkwave test.gtkw&

clean:
	rm *.vvp *.vcd
