#!/usr/bin/env python3
# coding:utf-8

from pykeigan import usbcontroller
from pykeigan import utils
import time
#  '0: 115200'
#  '1: 230400'
#  '2: 250000'
#  '3: 460800'
#  '4: 921600'
#  '5: 1000000 (1M)'

dev=usbcontroller.USBController("/dev/serial/by-id/usb-FTDI_FT230X_Basic_UART_DM00KFY2-if00-port0") # Set the current baudrate to communicate
#  '0: 115200'
#  '1: 230400'
#  '2: 250000'
#  '3: 460800'
#  '4: 921600'
#  '5: 1000000 (1M)'
dev.set_baud_rate(5) #5: 1Mbps
# 0:      2 [ms]
# 1:      5 [ms]
# 2:     10 [ms]
# 3:     20 [ms]
# 4:     50 [ms]
# 5:    100 [ms]
# 6:    200 [ms]
# 7:    500 [ms]
# 8:   1000 [ms]
# 9:   2000 [ms]
# 10:  5000 [ms]
# 11: 10000 [ms]
dev.set_motor_measurement_interval(2)
dev.set_motor_measurement_settings(5)  
dev.reset_all_pid
dev.save_all_registers()
print("dev.save_all_registers()")
time.sleep(1)
dev.reboot()

# dev.reset_all_registers()
# time.sleep(1)
# dev.reboot()