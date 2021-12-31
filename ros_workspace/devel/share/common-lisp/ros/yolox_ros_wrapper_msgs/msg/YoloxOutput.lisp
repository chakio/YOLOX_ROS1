; Auto-generated. Do not edit!


(cl:in-package yolox_ros_wrapper_msgs-msg)


;//! \htmlinclude YoloxOutput.msg.html

(cl:defclass <YoloxOutput> (roslisp-msg-protocol:ros-message)
  ((detected_objects
    :reader detected_objects
    :initarg :detected_objects
    :type (cl:vector yolox_ros_wrapper_msgs-msg:YoloxDetectedObject)
   :initform (cl:make-array 0 :element-type 'yolox_ros_wrapper_msgs-msg:YoloxDetectedObject :initial-element (cl:make-instance 'yolox_ros_wrapper_msgs-msg:YoloxDetectedObject))))
)

(cl:defclass YoloxOutput (<YoloxOutput>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <YoloxOutput>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'YoloxOutput)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolox_ros_wrapper_msgs-msg:<YoloxOutput> is deprecated: use yolox_ros_wrapper_msgs-msg:YoloxOutput instead.")))

(cl:ensure-generic-function 'detected_objects-val :lambda-list '(m))
(cl:defmethod detected_objects-val ((m <YoloxOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:detected_objects-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:detected_objects instead.")
  (detected_objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <YoloxOutput>) ostream)
  "Serializes a message object of type '<YoloxOutput>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detected_objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detected_objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <YoloxOutput>) istream)
  "Deserializes a message object of type '<YoloxOutput>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detected_objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detected_objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'yolox_ros_wrapper_msgs-msg:YoloxDetectedObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<YoloxOutput>)))
  "Returns string type for a message object of type '<YoloxOutput>"
  "yolox_ros_wrapper_msgs/YoloxOutput")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'YoloxOutput)))
  "Returns string type for a message object of type 'YoloxOutput"
  "yolox_ros_wrapper_msgs/YoloxOutput")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<YoloxOutput>)))
  "Returns md5sum for a message object of type '<YoloxOutput>"
  "b9b9a86cebc49e7b022259f40e43d47d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'YoloxOutput)))
  "Returns md5sum for a message object of type 'YoloxOutput"
  "b9b9a86cebc49e7b022259f40e43d47d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<YoloxOutput>)))
  "Returns full string definition for message of type '<YoloxOutput>"
  (cl:format cl:nil "yolox_ros_wrapper_msgs/YoloxDetectedObject[] detected_objects~%================================================================================~%MSG: yolox_ros_wrapper_msgs/YoloxDetectedObject~%string                                              class_name~%int32                                               class_id~%float32                                             score~%int32                                               x0~%int32                                               x1~%int32                                               y0~%int32                                               y1~%int32                                               image_width~%int32                                               image_height~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'YoloxOutput)))
  "Returns full string definition for message of type 'YoloxOutput"
  (cl:format cl:nil "yolox_ros_wrapper_msgs/YoloxDetectedObject[] detected_objects~%================================================================================~%MSG: yolox_ros_wrapper_msgs/YoloxDetectedObject~%string                                              class_name~%int32                                               class_id~%float32                                             score~%int32                                               x0~%int32                                               x1~%int32                                               y0~%int32                                               y1~%int32                                               image_width~%int32                                               image_height~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <YoloxOutput>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detected_objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <YoloxOutput>))
  "Converts a ROS message object to a list"
  (cl:list 'YoloxOutput
    (cl:cons ':detected_objects (detected_objects msg))
))
