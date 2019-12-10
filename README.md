# Micropython Controller for LMX2594 using the Hifive1 RISC-V board

## Board Wiring
5 wires of the LMX2594's SPI interface have to be connected to the Hifive1: GND, SCLK, MISO,
MOSI, and CS. The picture below shows where these wires have to be connected to
the Hifive1. The pinout of the LMX2594 can be found in the [documentation](http://www.ti.com/lit/ug/snau210/snau210.pdf)
<p align="center">
<img src="https://github.com/bkoppelmann/lmx2594-mp/blob/master/wiring.svg">
</p>
