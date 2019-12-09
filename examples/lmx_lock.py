import pyb
spi = pyb.SPI(2, 10000)
lmx = pyb.LMX2594(spi)

lmx.reset()
