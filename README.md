# Micropython Controller for LMX2594 using the Hifive1 RISC-V board

## Board Wiring
5 wires of the LMX2594's SPI interface have to be connected to the Hifive1: GND, SCLK, MISO,
MOSI, and CS. The picture below shows where these wires have to be connected to
the Hifive1. The pinout of the LMX2594 can be found in the [documentation](http://www.ti.com/lit/ug/snau210/snau210.pdf) of TI. For the CS bin you need to select one GPIO. You need to remember that pin number if you want to use SPI in python.
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
If you have the [freedom-e-sdk](https://github.com/hni-sct/freedom-e-sdk) already installed, you can skip the steps above, but you need to set the environment variable FREEDOM_E for all steps below.

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

## Micropython console
You can connect to the micropython REPL using screen:
```
screen /dev/ttyUSB1 115200
```
You should see a message like:
```
core freq at 285523968 Hz
MicroPython v1.9.3-776-g5d35f272-dirty on 2019-12-10; Arty FPGA Dev Kit with E310
Type "help()" for more information.
>>>
```
If not, press the reset button on the board or type `make upload` again.
To interact with the LMX first import the `python board library` (pyb)  by
typing on the REPL:
```
>>> import pyb
```
Then create an SPI interface using a CS pin 2 (if you selected another pin
during wiring, replace the 2 with that pin) and a maximum SPI frequency of
10000.
```
>>> spi = pyb.SPI(2, 10000)
```
Now you can use that interface to write SPI messages to the LMX2594
```
>>> spi.write(2, 0x500)
```
which writes 0x500 to register 2 of the LMX2594. 
To make the LMX2594 lock you need to create an LMX2594 object and give it an SPI
interface
```
>>> lmx = LMX2594(spi)
```
and then run reset on that
```
>>> lmx.reset()
```

## Upload micropython scripts
If you don't want to type all commands repeatedly on the REPL you can upload
them using the upload.py script. For example, to do the locking sequence simple
type
```
$ ./upload.py < examples/lmx_lock.py
```
