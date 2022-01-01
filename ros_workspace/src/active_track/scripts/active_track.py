#!/usr/bin/env python3
# coding:utf-8

import rospy
from yolox_ros_wrapper_msgs.msg import YoloxOutput
from std_msgs.msg import String
import tf

from pykeigan import usbcontroller

import threading
import time
import math
import numpy as np

class ActiveTrack():
    def __init__(self):
        
        self.dev=usbcontroller.USBController("/dev/serial/by-id/usb-FTDI_FT230X_Basic_UART_DM00KFY2-if00-port0", baud=1000000)
        self.dev.preset_position(0)
        # self.dev.set_motor_measurement_interval(0)
        self.dev.set_curve_type(1)
        self.dev.set_acc(30)
        self.dev.set_dec(10)
        self.yolox_updated_time = time.time()
        self.dev.set_speed_i(0.005)
        # self.dev.set_speed_d(0.1)
        # self.dev.set_speed_p(1)
        
        self.pub = rospy.Publisher('command', String, queue_size=10)
        yolox_sub   = rospy.Subscriber("/yolox/output", YoloxOutput, self.on_yolox_cb)
        time.sleep(1)

        self.dev.on_motor_measurement_value_cb = self.on_motor_measurement_cb
        self.motor_measurement_count = 0
        self.dev.enable_action()
        self.angle = 0
        self.person_direction = 0

        self.phase = "Wait"
        self.command = False
        self.start = time.time()

        r = rospy.Rate(60)
        while not rospy.is_shutdown():
            self.calcurate_velocity()
            r.sleep()
        self.dev.run_at_velocity(0)
        self.dev.free_motor()
    
    def on_motor_measurement_cb(self, measurement):
        self.angle = measurement["position"]
        self.broadcast_tf(self.angle)

    def on_yolox_cb(self, data):
        for object in data.detected_objects:
            if object.class_name == "person":
                self.yolox_updated_time = time.time()
                # print(object)
                width = object.image_width
                self.person_direction = (object.x0 + object.y0)/2.0 - (width/2.0)
                # print(self.person_direction)
                break

    def broadcast_tf(self, angle):
        br = tf.TransformBroadcaster()
        br.sendTransform((0.0505, 0, 0),tf.transformations.quaternion_from_euler(0, 0, 0),rospy.Time.now(),"camera_base", "keigan_motor/rotor")
        br.sendTransform((0, 0, 0),tf.transformations.quaternion_from_euler(0, 0, angle),rospy.Time.now(),"keigan_motor/rotor","keigan_motor/base")

    def calcurate_velocity(self):
        
        
        vel = -0.01 * self.person_direction
        vel = np.clip(vel, -1.5, 1.5)
        # vel = np.clip(vel, -1, 1)
        if self.angle > math.pi/2:
            vel = 0
        elif self.angle < -math.pi/2:
            vel = 0
        elif time.time() - self.yolox_updated_time > 0.5:
            vel = 0
        self.dev.run_at_velocity(vel)
        # print(vel)

if __name__ == '__main__':
    rospy.init_node('active_track_node')
    km = ActiveTrack()