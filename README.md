# Micropython Controller for LMX2594 using the Hifive1 RISC-V board

## Board Wiring
5 wires of the LMX2594's SPI interface have to be connected to the Hifive1: GND, SCLK, MISO,
MOSI, and CS. The picture below shows where these wires have to be connected to
the Hifive1. The pinout of the LMX2594 can be found in the [documentation](http://www.ti.com/lit/ug/snau210/snau210.pdf) of TI.
<p align="center">
<img src="https://github.com/bkoppelmann/lmx2594-mp/blob/master/wiring.svg">
</p>

## Building the Toolchain
First download the submodules by typing
```
$ git submodule update --init --recursive
```
then build the [freedom-e-sdk](https://github.com/hni-sct/freedom-e-sdk) by
```
$ make tools
```
If you have the [freedom-e-sdk](https://github.com/hni-sct/freedom-e-sdk) already installed, you can skip the steps above, but you need to set the enviroment variable FREEDOM_E for all steps below.

## Building the Micropython Firmware
Simply type
```
$ make firmware
```
Before uploading the firmware check chapter 5 of the [Getting Started
Guide](https://sifive.cdn.prismic.io/sifive%2F9c57065b-6d28-465b-b67d-f416894123a9_hifive1-getting-started-v1.0.2.pdf)
and check whether you can connect to the Hifive1. If you verified that you can
upload programs, then you can simply type:
```
$ make upload
```
