#!/usr/bin/env python3
# coding:utf-8

import os
import shutil
import psutil

import datetime
import time

import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk, ImageOps  # 画像データ用
import cv2
import numpy as np

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Image as RosImage
from cv_bridge import CvBridge, CvBridgeError

window_size_width = 640
window_size_height = 360


class ActiveTrackGui:
    def __init__(self):
        # self.root = tk.Tk()
        self.root = tk.Toplevel()
        # self.root.attributes("-topmost", True)
        self.root.resizable(width=False, height=False)
        self.yolox_image = np.zeros((480, 640, 3), np.uint8)

        self.create_window()
        self.ros_setting()
        self.recording = False

    def create_window(self):
        self.root.title("Active Track Gui")
        
        self.root.geometry(str(window_size_width)+"x"+str(window_size_height+70)+"+"+str(self.root.winfo_screenwidth())+"+0")
        self.root.protocol("WM_DELETE_WINDOW", self.close)
        self.canvas = tk.Canvas(self.root)
        self.canvas.pack(expand = True, fill = tk.BOTH)
        self.statustext = tk.StringVar()
        self.statustext.set("Standby")
        self.statuslabel = tk.Label(self.root, textvariable=self.statustext,font=("",20))
        self.statuslabel.place(width=240, height=70,x=0, y=window_size_height)  
        self.startbuttontext = tk.StringVar()
        self.startbuttontext.set("Start")
        self.startbutton = tk.Button(self.root,  textvariable=self.startbuttontext,font=("",20),  foreground='#F00', command=self.publish_start).place(width=200, height=70,x=240, y=window_size_height)
        self.stopbuttontext = tk.StringVar()
        self.stopbuttontext.set("Stop")
        self.stopbutton = tk.Button(self.root,  textvariable=self.stopbuttontext,font=("",20),  foreground='#F00', command=self.publish_stop).place(width=200, height=70,x=440, y=window_size_height)    

    def ros_setting(self):
        rospy.init_node("active_track_gui_node")
        self.bridge      = CvBridge()
        image_sub = rospy.Subscriber("/yolox/image", RosImage, self.yolox_callback)
        self.command_pub = rospy.Publisher("/command",String, queue_size=1)

    def yolox_callback(self, data):
        self.yolox_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    
    def publish_start(self):
        if not self.recording:
            self.command_pub.publish("start")
            self.recording = True
            self.statustext.set("Recording")

    def publish_stop(self):
        if self.recording:
            self.command_pub.publish("end")
            self.recording = False
            self.statustext.set("Standby")

    def run(self):
        self.update_frame()
        # self.root.after(30, self.update_frame())
        self.root.mainloop()
        self.close()

    
    def update_frame(self):
        self.canvas.delete("p")
        # PIL.ImageからPhotoImageへ変換する
        cv_image = cv2.cvtColor(self.yolox_image, cv2.COLOR_BGR2RGB)
        pil_image = Image.fromarray(cv_image)
        self.photo_image = ImageTk.PhotoImage(image=pil_image)

        # 画像の描画
        self.canvas.create_image(
                window_size_width / 2,
                window_size_height / 2,                   
                image=self.photo_image,
                tag='p'
        )

        if rospy.is_shutdown():
            self.close()

        self.root.after(1, self.update_frame)

    def close(self):
        exit()



if __name__ == '__main__':
   
    root = tk.Tk()
    root.withdraw()
    r = ActiveTrackGui()
    r.run()
    
