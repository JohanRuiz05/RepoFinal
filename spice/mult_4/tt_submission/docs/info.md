<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The project is an implementation of a 4-bit multiplier with two inputs (A and B) and a start signal (init).

## How to test

The project use the open-source tool Xyce to test the analog circuit design of the top module (Mult_4_nl.v), obtained from the SPICE model of the verilog files. In this way, the signals required to ensure the multiplier's operation were verified.Then, you must program an external flash memory with desired application.

## External hardware

The project does not use any external hardware.
