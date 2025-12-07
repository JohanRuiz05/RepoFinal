###############################################################################
# Created by write_sdc
# Mon Sep 29 19:18:23 2025
###############################################################################
current_design femto
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 25.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {RXD}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {resetn}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_miso}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_miso_ram}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {LEDS}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {TXD}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_clk}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_clk_ram}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_cs_n}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_cs_n_ram}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_mosi}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_mosi_ram}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {LEDS}]
set_load -pin_load 0.0334 [get_ports {TXD}]
set_load -pin_load 0.0334 [get_ports {spi_clk}]
set_load -pin_load 0.0334 [get_ports {spi_clk_ram}]
set_load -pin_load 0.0334 [get_ports {spi_cs_n}]
set_load -pin_load 0.0334 [get_ports {spi_cs_n_ram}]
set_load -pin_load 0.0334 [get_ports {spi_mosi}]
set_load -pin_load 0.0334 [get_ports {spi_mosi_ram}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {RXD}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {resetn}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {spi_miso}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {spi_miso_ram}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
