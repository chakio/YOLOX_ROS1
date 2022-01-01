#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# Copyright (c) Megvii, Inc. and its affiliates.

import argparse
import os
import time
from loguru import logger

import cv2

import torch

from yolox.data.data_augment import ValTransform
from yolox.data.datasets import COCO_CLASSES
from yolox.exp import get_exp
from yolox.utils import fuse_model, get_model_info, postprocess, vis

import rospy
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image

from yolox_ros_wrapper_msgs.msg import YoloxOutput
from yolox_ros_wrapper_msgs.msg import YoloxDetectedObject

class parameter:
    def __init__(self):
        self.demo = "image"
        # model name
        self.name = "yolox-s"
        # 
        self.camid = 0
        self.ckpt = "/YOLOX/yolox_s.pth"
        # "device to run our model, can either be cpu or gpu",
        self.device = "gpu"
        self.conf = 0.3
        self.nms = 0.3
        self.tsize = 640
        self.path = "/YOLOX/assets/dog.jpg"

class YoloxHandler:
    def __init__(self, exp, args):
        vis_folder = None

        logger.info("Args: {}".format(args))

        if args.conf is not None:
            exp.test_conf = args.conf
        if args.nms is not None:
            exp.nmsthre = args.nms
        if args.tsize is not None:
            exp.test_size = (args.tsize, args.tsize)

        model = exp.get_model()
        logger.info("Model Summary: {}".format(get_model_info(model, exp.test_size)))

        if args.device == "gpu":
            model.cuda()
        model.eval()

        if args.ckpt is None:
            ckpt_file = os.path.join(file_name, "best_ckpt.pth")
        else:
            ckpt_file = args.ckpt
        logger.info("loading checkpoint")
        ckpt = torch.load(ckpt_file, map_location="cpu")
        # load the model state dict
        model.load_state_dict(ckpt["model"])
        logger.info("loaded checkpoint done.")

        self.predictor = self.Predictor(
            model, exp, COCO_CLASSES, args.device
        )

    class Predictor:
        def __init__(
            self,
            model,
            exp,
            cls_names=COCO_CLASSES,
            device="cpu",
        ):
            self.model = model
            self.cls_names = cls_names
            self.num_classes = exp.num_classes
            self.confthre = exp.test_conf
            self.nmsthre = exp.nmsthre
            self.test_size = exp.test_size
            self.device = device
            self.preproc = ValTransform(legacy=False)
        

        def inference(self, img):
            img_info = {"id": 0}
            img_info["file_name"] = None

            height, width = img.shape[:2]
            img_info["height"] = height
            img_info["width"] = width
            img_info["raw_img"] = img

            ratio = min(self.test_size[0] / img.shape[0], self.test_size[1] / img.shape[1])
            img_info["ratio"] = ratio

            img, _ = self.preproc(img, None, self.test_size)
            img = torch.from_numpy(img).unsqueeze(0)
            img = img.float()
            if self.device == "gpu":
                img = img.cuda()

            with torch.no_grad():
                t0 = time.time()
                outputs = self.model(img)
                outputs = postprocess(
                    outputs, self.num_classes, self.confthre,
                    self.nmsthre, class_agnostic=True
                )
                # logger.info("Infer time: {:.4f}s".format(time.time() - t0))
            return outputs, img_info

        def visual(self, output, img_info, cls_conf=0.35):
            ratio = img_info["ratio"]
            img = img_info["raw_img"]
            if output is None:
                return img
            output = output.cpu()

            bboxes = output[:, 0:4]

            # preprocessing: resize
            bboxes /= ratio

            cls = output[:, 6]
            scores = output[:, 4] * output[:, 5]

            vis_res = vis(img, bboxes, scores, cls, cls_conf, self.cls_names)
            return vis_res

class YoloxNode:
    def __init__(self, exp, params):
        self.yolox_handler = YoloxHandler(exp, params)
        rospy.init_node("yolox_node")
        self.bridge      = CvBridge()
        image_sub   = rospy.Subscriber("/rgb/image_raw", Image, self.image_callback)
        self.image_pub = rospy.Publisher("/yolox/image",Image, queue_size=1)
        self.output_pub = rospy.Publisher("/yolox/output",YoloxOutput, queue_size=10)
        rospy.spin()

    def image_callback(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            h, w = cv_image.shape[:2]
            width = params.tsize
            height = round(h * (width / w))
            resized_image = cv2.resize(cv_image, dsize=(width, height))
            result, result_image = self.get_inference_result(resized_image)
            if result is not None:
                self.output_pub.publish(result)
                self.image_pub.publish(self.bridge.cv2_to_imgmsg(result_image, "bgr8"))
            # cv2.imshow('color', cv_image)
            # ch = cv2.waitKey(1)

        except CvBridgeError as e:
            print('Cv_Bridge_Error')

    def get_inference_result(self, image):
        outputs, img_info = self.yolox_handler.predictor.inference(image)
        if outputs[0] is not None:
            result = self.get_output_msgs(outputs[0], image)
            result_image = self.yolox_handler.predictor.visual(outputs[0], img_info, self.yolox_handler.predictor.confthre)
            return result, result_image
        else:
            return None, None
        # cv2.imshow('color',result_image)
        # ch = cv2.waitKey(1)
        

    def get_output_msgs(self, outputs, image):
        msgs = YoloxOutput()
        for object_index, output in enumerate (outputs):
            obj = YoloxDetectedObject()
            obj.class_id = int(output[6].item())
            obj.class_name = self.yolox_handler.predictor.cls_names[obj.class_id]
            obj.score = output[4].item() * output[5].item()
            # print("\t object id:",class_id)
            # print("\t object name:",class_name)
            # print("\t score:", score)
            
            box = output[0:4]
            obj.x0 = int(box[0].item())
            obj.x1 = int(box[1].item())
            obj.y0 = int(box[2].item())
            obj.y1 = int(box[3].item())
            # print("\t x0:", x0)
            # print("\t x1:", x1)
            # print("\t y0:", y0)
            # print("\t y1:", y1)
            obj.image_height, obj.image_width = image.shape[:2]
            # print("\t image_width:", width)
            # print("\t image_height:", height)

            msgs.detected_objects.append(
                obj
            )
        return msgs

if __name__ == "__main__":
    params = parameter()
    exp = get_exp(None, params.name)
    yolox_node = YoloxNode(exp, params)
