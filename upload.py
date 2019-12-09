#!/usr/bin/env python3
import serial, time
import io
import fileinput

ser = serial.Serial()
ser.port = '/dev/ttyUSB1'
ser.baudrate = 115200
ser.timeout = 1
ser.open()
sio = io.TextIOWrapper(io.BufferedRWPair(ser, ser))

for line in fileinput.input():
    line = line + '\r'
    sio.write(line)
    sio.flush()
    time.sleep(0.5)

ser.close()
