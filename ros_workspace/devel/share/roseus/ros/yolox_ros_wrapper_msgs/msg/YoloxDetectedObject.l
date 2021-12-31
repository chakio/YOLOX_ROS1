;; Auto-generated. Do not edit!


(when (boundp 'yolox_ros_wrapper_msgs::YoloxDetectedObject)
  (if (not (find-package "YOLOX_ROS_WRAPPER_MSGS"))
    (make-package "YOLOX_ROS_WRAPPER_MSGS"))
  (shadow 'YoloxDetectedObject (find-package "YOLOX_ROS_WRAPPER_MSGS")))
(unless (find-package "YOLOX_ROS_WRAPPER_MSGS::YOLOXDETECTEDOBJECT")
  (make-package "YOLOX_ROS_WRAPPER_MSGS::YOLOXDETECTEDOBJECT"))

(in-package "ROS")
;;//! \htmlinclude YoloxDetectedObject.msg.html


(defclass yolox_ros_wrapper_msgs::YoloxDetectedObject
  :super ros::object
  :slots (_class_name _class_id _score _x0 _x1 _y0 _y1 _image_width _image_height ))

(defmethod yolox_ros_wrapper_msgs::YoloxDetectedObject
  (:init
   (&key
    ((:class_name __class_name) "")
    ((:class_id __class_id) 0)
    ((:score __score) 0.0)
    ((:x0 __x0) 0)
    ((:x1 __x1) 0)
    ((:y0 __y0) 0)
    ((:y1 __y1) 0)
    ((:image_width __image_width) 0)
    ((:image_height __image_height) 0)
    )
   (send-super :init)
   (setq _class_name (string __class_name))
   (setq _class_id (round __class_id))
   (setq _score (float __score))
   (setq _x0 (round __x0))
   (setq _x1 (round __x1))
   (setq _y0 (round __y0))
   (setq _y1 (round __y1))
   (setq _image_width (round __image_width))
   (setq _image_height (round __image_height))
   self)
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:x0
   (&optional __x0)
   (if __x0 (setq _x0 __x0)) _x0)
  (:x1
   (&optional __x1)
   (if __x1 (setq _x1 __x1)) _x1)
  (:y0
   (&optional __y0)
   (if __y0 (setq _y0 __y0)) _y0)
  (:y1
   (&optional __y1)
   (if __y1 (setq _y1 __y1)) _y1)
  (:image_width
   (&optional __image_width)
   (if __image_width (setq _image_width __image_width)) _image_width)
  (:image_height
   (&optional __image_height)
   (if __image_height (setq _image_height __image_height)) _image_height)
  (:serialization-length
   ()
   (+
    ;; string _class_name
    4 (length _class_name)
    ;; int32 _class_id
    4
    ;; float32 _score
    4
    ;; int32 _x0
    4
    ;; int32 _x1
    4
    ;; int32 _y0
    4
    ;; int32 _y1
    4
    ;; int32 _image_width
    4
    ;; int32 _image_height
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;; int32 _class_id
       (write-long _class_id s)
     ;; float32 _score
       (sys::poke _score (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _x0
       (write-long _x0 s)
     ;; int32 _x1
       (write-long _x1 s)
     ;; int32 _y0
       (write-long _y0 s)
     ;; int32 _y1
       (write-long _y1 s)
     ;; int32 _image_width
       (write-long _image_width s)
     ;; int32 _image_height
       (write-long _image_height s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _class_id
     (setq _class_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _score
     (setq _score (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _x0
     (setq _x0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x1
     (setq _x1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y0
     (setq _y0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y1
     (setq _y1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _image_width
     (setq _image_width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _image_height
     (setq _image_height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolox_ros_wrapper_msgs::YoloxDetectedObject :md5sum-) "44c56aadd6a52be9f308b0035f12dded")
(setf (get yolox_ros_wrapper_msgs::YoloxDetectedObject :datatype-) "yolox_ros_wrapper_msgs/YoloxDetectedObject")
(setf (get yolox_ros_wrapper_msgs::YoloxDetectedObject :definition-)
      "string                                              class_name
int32                                               class_id
float32                                             score
int32                                               x0
int32                                               x1
int32                                               y0
int32                                               y1
int32                                               image_width
int32                                               image_height
")



(provide :yolox_ros_wrapper_msgs/YoloxDetectedObject "44c56aadd6a52be9f308b0035f12dded")


