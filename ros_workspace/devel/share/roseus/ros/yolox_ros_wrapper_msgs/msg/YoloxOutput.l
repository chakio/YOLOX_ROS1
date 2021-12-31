;; Auto-generated. Do not edit!


(when (boundp 'yolox_ros_wrapper_msgs::YoloxOutput)
  (if (not (find-package "YOLOX_ROS_WRAPPER_MSGS"))
    (make-package "YOLOX_ROS_WRAPPER_MSGS"))
  (shadow 'YoloxOutput (find-package "YOLOX_ROS_WRAPPER_MSGS")))
(unless (find-package "YOLOX_ROS_WRAPPER_MSGS::YOLOXOUTPUT")
  (make-package "YOLOX_ROS_WRAPPER_MSGS::YOLOXOUTPUT"))

(in-package "ROS")
;;//! \htmlinclude YoloxOutput.msg.html


(defclass yolox_ros_wrapper_msgs::YoloxOutput
  :super ros::object
  :slots (_detected_objects ))

(defmethod yolox_ros_wrapper_msgs::YoloxOutput
  (:init
   (&key
    ((:detected_objects __detected_objects) ())
    )
   (send-super :init)
   (setq _detected_objects __detected_objects)
   self)
  (:detected_objects
   (&rest __detected_objects)
   (if (keywordp (car __detected_objects))
       (send* _detected_objects __detected_objects)
     (progn
       (if __detected_objects (setq _detected_objects (car __detected_objects)))
       _detected_objects)))
  (:serialization-length
   ()
   (+
    ;; yolox_ros_wrapper_msgs/YoloxDetectedObject[] _detected_objects
    (apply #'+ (send-all _detected_objects :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; yolox_ros_wrapper_msgs/YoloxDetectedObject[] _detected_objects
     (write-long (length _detected_objects) s)
     (dolist (elem _detected_objects)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; yolox_ros_wrapper_msgs/YoloxDetectedObject[] _detected_objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detected_objects (let (r) (dotimes (i n) (push (instance yolox_ros_wrapper_msgs::YoloxDetectedObject :init) r)) r))
     (dolist (elem- _detected_objects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get yolox_ros_wrapper_msgs::YoloxOutput :md5sum-) "b9b9a86cebc49e7b022259f40e43d47d")
(setf (get yolox_ros_wrapper_msgs::YoloxOutput :datatype-) "yolox_ros_wrapper_msgs/YoloxOutput")
(setf (get yolox_ros_wrapper_msgs::YoloxOutput :definition-)
      "yolox_ros_wrapper_msgs/YoloxDetectedObject[] detected_objects
================================================================================
MSG: yolox_ros_wrapper_msgs/YoloxDetectedObject
string                                              class_name
int32                                               class_id
float32                                             score
int32                                               x0
int32                                               x1
int32                                               y0
int32                                               y1
int32                                               image_width
int32                                               image_height
")



(provide :yolox_ros_wrapper_msgs/YoloxOutput "b9b9a86cebc49e7b022259f40e43d47d")


