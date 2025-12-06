`timescale 1ns / 1ps

module tt_um_mult_4_TB;

  // Declaración de señales de testbench (registros para entradas, wires para salidas)
  reg clk;
  reg rst_n; // Señal de reset asíncrona (active low)
  reg init;
  reg [3:0] A;
  reg [3:0] B;
  wire [7:0] pp;
  wire done;
  
  // Variables de control y verificación
  integer i;
  reg [7:0] expected_pp;

  // Instancia del Módulo Bajo Prueba (MUT: Module Under Test)
  // El testbench se conecta al módulo 'tt_um_mult_4' de nivel superior
  // y usa sus pines de E/S.
  // Nota: `ui_in` lleva A y B, `uio_in[0]` lleva `init`.
  wire [7:0] ui_in_tb;
  wire [7:0] uo_out_tb;
  wire [7:0] uio_in_tb;
  wire [7:0] uio_out_tb;
  wire [7:0] uio_oe_tb;
  wire ena_tb;
  
  // Conexión del testbench a los puertos del módulo superior
  assign ui_in_tb[3:0] = A;
  assign ui_in_tb[7:4] = B;
  assign uio_in_tb[0] = init;
  assign uio_in_tb[7:1] = 7'b0; // Pines uio_in no usados, a 0
  assign ena_tb = 1'b1; // Ena siempre a 1
  
  // Instancia del Módulo de nivel superior (tt_um_mult_4)
  tt_um_mult_4 MUT (
      .ui_in(ui_in_tb),
      .uo_out(uo_out_tb),
      .uio_in(uio_in_tb),
      .uio_out(uio_out_tb),
      .uio_oe(uio_oe_tb),
      .ena(ena_tb),
      .clk(clk),
      .rst_n(rst_n)
  );
  
  // Mapeo de salidas relevantes desde el módulo superior
  assign pp = uo_out_tb; // pp es uo_out[7:0] en el módulo superior
  assign done = uio_out_tb[1]; // done es uio_out[1] en el módulo superior

  parameter PERIOD = 20;
   initial begin  // Initialize Inputs
      clk = 0; rst_n = 0; init = 0; A = 8'h03; B = 8'h03;
   end
   // clk generation
   initial         clk <= 0;
   always #(PERIOD/2) clk <= ~clk;

   initial begin // Reset the system, Start the image capture process
        // Reset 
        @ (negedge clk);
	     rst_n = 1;
	     @ (negedge clk);
	     rst_n = 0;
        #(PERIOD*4)
        init = 0;
        @ (posedge clk);
        init = 1;
        #(PERIOD*2)
        init = 0;
        #(PERIOD*50);
        @ (negedge clk);
	     rst_n = 1;
       @ (negedge clk);
	     rst_n = 0;
        #(PERIOD*4)
        init = 0;
        @ (posedge clk);
        init = 1;
        #(PERIOD*2)
        init = 0;
        #(PERIOD*50);
   end
	 

   initial begin: TEST_CASE
     $dumpfile("tt_um_mult_4_TB.vcd");
     $dumpvars(-1, tt_um_mult_4_TB);
     #(PERIOD*100) $finish;
   end

endmodule