TARGET=tt_um_mult_4
TOP=tt_um_mult_4
NPROC=4

SIM_OBJS = src/mult_4.v
SIM_OBJS += src/acc.v
SIM_OBJS += src/comp.v
SIM_OBJS += src/control_mult.v
SIM_OBJS += src/lsr.v
SIM_OBJS += src/rsr.v
SIM_OBJS_SKY = src/verilog_model/sky130_fd_sc_hd.v
SIM_OBJS_SKY += src/verilog_model/primitives.v


BUILD_DIR = build

all: sim

sim:
	rm -f a.out *.vcd
	iverilog -DBENCH -DSIM -DPASSTHROUGH_PLL -DBOARD_FREQ=50 -DCPU_FREQ=50 tt_um_mult_4_TB.v ${SIM_OBJS}	
	vvp a.out
	gtkwave $(TARGET)_TB.vcd $(TARGET)_TB.gtkw

sim_per:
	rm -f a.out *.vcd
	iverilog  -DFUNCTIONAL -DUNIT_DELAY=#1  perip_$(TARGET)_TB.v $(PER_OBJS)
	vvp a.out
	gtkwave perip_$(TARGET)_TB.vcd 

spice:
	ngspice ${TARGET}.spice
	python plot_${TARGET}.py


xyce:
	mpirun -np ${NPROC} Xyce ${TARGET}_TB.cir
	python plot_${TARGET}.py

xyce_tim:
	python3 ../tim_to_pwl.py Mult_4.tim
	mpirun -np ${NPROC} Xyce ${TARGET}.cir
	python plot_${TARGET}.py


clean:
	rm -rf *.out *.vcd *.svg *.json *.raw
