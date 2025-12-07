import ltspice
import matplotlib.pyplot as plt
import numpy as np
import os
#from scipy import signal

filepath='/home/sebastian/VLSI/femtoRV/spice/mult_4_2/tt_um_mult_4.raw'
l=ltspice.Ltspice(filepath)
l.parse()

# Obtener y mostrar todos los nombres de las señales
signal_names = l.getVariableNames()

## Nombres de las Señales Disponibles
print("Nombres de todas las señales en el archivo:")
for name in signal_names:
    print(f"- {name}")
    
time=l.get_time()
V1=l.get_data('V(clk)')
V2=l.get_data('v(rst_n)')
V3=l.get_data('v(uio_in[0])')

V4=l.get_data('v(ui_in[0])')
V5=l.get_data('v(ui_in[1])')
V6=l.get_data('v(ui_in[2])')
V7=l.get_data('v(ui_in[3])')

V8=l.get_data('v(ui_in[4])')
V9=l.get_data('v(ui_in[5])')
V10=l.get_data('v(ui_in[6])')
V11=l.get_data('v(ui_in[7])')

V12=l.get_data('v(uo_out[0])')
V13=l.get_data('v(uo_out[1])')
V14=l.get_data('v(uo_out[2])')
V15=l.get_data('v(uo_out[3])')
V16=l.get_data('v(uo_out[4])')
V17=l.get_data('v(uo_out[5])')
V18=l.get_data('v(uo_out[6])')
V19=l.get_data('v(uo_out[7])')

V20=l.get_data('v(uio_out[1])')

signals = [V1, V2, V3, V12, V13, V14, V15, V16, V17, V18, V19, V20]
sig_names = ["clk", "rst_n", "init", "pp0", "pp1", "pp2", "pp3", "pp4", "pp5", "pp6", "pp7", "done"]

# Create stacked subplots
fig, axes = plt.subplots(15, 1, figsize=(12, 20), sharex=True)

for i, (ax, sig) in enumerate(zip(axes, signals)):
    ax.plot(time, sig, color=plt.cm.viridis(i/15), linewidth=1)  # Color gradient
    ax.set_ylabel(sig_names[i], rotation=0, ha='right', va='center')
    ax.grid(alpha=0.3)
    ax.set_ylim(-0.5, 3.5)

axes[-1].set_xlabel('Time (s)')
plt.suptitle('17 Signals (Stacked Subplots)', y=0.92)
plt.tight_layout()
plt.show()



plt.plot(time, V1, label = "clk")
plt.plot(time, V2+4)
plt.plot(time, V3+8)
plt.plot(time, V4+12)
plt.plot(time, V5+16)
plt.plot(time, V6+20)
plt.plot(time, V7+24)
plt.plot(time, V8+28)
plt.plot(time, V9+32)
plt.plot(time, V10+36)
plt.plot(time, V11+40)
plt.plot(time, V12+44)
plt.plot(time, V13+48)
plt.plot(time, V14+52)
plt.plot(time, V15+56)
plt.plot(time, V16+60)
plt.plot(time, V17+64)
plt.plot(time, V18+70)
plt.plot(time, V19+74)
plt.legend()
plt.grid()
plt.show()


