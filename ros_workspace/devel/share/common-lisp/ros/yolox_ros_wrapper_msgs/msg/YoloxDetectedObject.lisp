; Auto-generated. Do not edit!


(cl:in-package yolox_ros_wrapper_msgs-msg)


;//! \htmlinclude YoloxDetectedObject.msg.html

(cl:defclass <YoloxDetectedObject> (roslisp-msg-protocol:ros-message)
  ((class_name
    :reader class_name
    :initarg :class_name
    :type cl:string
    :initform "")
   (class_id
    :reader class_id
    :initarg :class_id
    :type cl:integer
    :initform 0)
   (score
    :reader score
    :initarg :score
    :type cl:float
    :initform 0.0)
   (x0
    :reader x0
    :initarg :x0
    :type cl:integer
    :initform 0)
   (x1
    :reader x1
    :initarg :x1
    :type cl:integer
    :initform 0)
   (y0
    :reader y0
    :initarg :y0
    :type cl:integer
    :initform 0)
   (y1
    :reader y1
    :initarg :y1
    :type cl:integer
    :initform 0)
   (image_width
    :reader image_width
    :initarg :image_width
    :type cl:integer
    :initform 0)
   (image_height
    :reader image_height
    :initarg :image_height
    :type cl:integer
    :initform 0))
)

(cl:defclass YoloxDetectedObject (<YoloxDetectedObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <YoloxDetectedObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'YoloxDetectedObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolox_ros_wrapper_msgs-msg:<YoloxDetectedObject> is deprecated: use yolox_ros_wrapper_msgs-msg:YoloxDetectedObject instead.")))

(cl:ensure-generic-function 'class_name-val :lambda-list '(m))
(cl:defmethod class_name-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:class_name-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:class_name instead.")
  (class_name m))

(cl:ensure-generic-function 'class_id-val :lambda-list '(m))
(cl:defmethod class_id-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:class_id-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:class_id instead.")
  (class_id m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:score-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'x0-val :lambda-list '(m))
(cl:defmethod x0-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:x0-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:x0 instead.")
  (x0 m))

(cl:ensure-generic-function 'x1-val :lambda-list '(m))
(cl:defmethod x1-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:x1-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:x1 instead.")
  (x1 m))

(cl:ensure-generic-function 'y0-val :lambda-list '(m))
(cl:defmethod y0-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:y0-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:y0 instead.")
  (y0 m))

(cl:ensure-generic-function 'y1-val :lambda-list '(m))
(cl:defmethod y1-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:y1-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:y1 instead.")
  (y1 m))

(cl:ensure-generic-function 'image_width-val :lambda-list '(m))
(cl:defmethod image_width-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:image_width-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:image_width instead.")
  (image_width m))

(cl:ensure-generic-function 'image_height-val :lambda-list '(m))
(cl:defmethod image_height-val ((m <YoloxDetectedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolox_ros_wrapper_msgs-msg:image_height-val is deprecated.  Use yolox_ros_wrapper_msgs-msg:image_height instead.")
  (image_height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <YoloxDetectedObject>) ostream)
  "Serializes a message object of type '<YoloxDetectedObject>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'class_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'class_name))
  (cl:let* ((signed (cl:slot-value msg 'class_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'x0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'image_width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'image_height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <YoloxDetectedObject>) istream)
  "Deserializes a message object of type '<YoloxDetectedObject>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'class_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x0) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y0) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'image_width) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'image_height) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<YoloxDetectedObject>)))
  "Returns string type for a message object of type '<YoloxDetectedObject>"
  "yolox_ros_wrapper_msgs/YoloxDetectedObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'YoloxDetectedObject)))
  "Returns string type for a message object of type 'YoloxDetectedObject"
  "yolox_ros_wrapper_msgs/YoloxDetectedObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<YoloxDetectedObject>)))
  "Returns md5sum for a message object of type '<YoloxDetectedObject>"
  "44c56aadd6a52be9f308b0035f12dded")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'YoloxDetectedObject)))
  "Returns md5sum for a message object of type 'YoloxDetectedObject"
  "44c56aadd6a52be9f308b0035f12dded")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<YoloxDetectedObject>)))
  "Returns full string definition for message of type '<YoloxDetectedObject>"
  (cl:format cl:nil "string                                              class_name~%int32                                               class_id~%float32                                             score~%int32                                               x0~%int32                                               x1~%int32                                               y0~%int32                                               y1~%int32                                               image_width~%int32                                               image_height~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'YoloxDetectedObject)))
  "Returns full string definition for message of type 'YoloxDetectedObject"
  (cl:format cl:nil "string                                              class_name~%int32                                               class_id~%float32                                             score~%int32                                               x0~%int32                                               x1~%int32                                               y0~%int32                                               y1~%int32                                               image_width~%int32                                               image_height~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <YoloxDetectedObject>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'class_name))
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <YoloxDetectedObject>))
  "Converts a ROS message object to a list"
  (cl:list 'YoloxDetectedObject
    (cl:cons ':class_name (class_name msg))
    (cl:cons ':class_id (class_id msg))
    (cl:cons ':score (score msg))
    (cl:cons ':x0 (x0 msg))
    (cl:cons ':x1 (x1 msg))
    (cl:cons ':y0 (y0 msg))
    (cl:cons ':y1 (y1 msg))
    (cl:cons ':image_width (image_width msg))
    (cl:cons ':image_height (image_height msg))
))
