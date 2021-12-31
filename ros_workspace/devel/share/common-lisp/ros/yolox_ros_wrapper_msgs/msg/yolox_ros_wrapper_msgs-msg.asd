
(cl:in-package :asdf)

(defsystem "yolox_ros_wrapper_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "YoloxDetectedObject" :depends-on ("_package_YoloxDetectedObject"))
    (:file "_package_YoloxDetectedObject" :depends-on ("_package"))
    (:file "YoloxOutput" :depends-on ("_package_YoloxOutput"))
    (:file "_package_YoloxOutput" :depends-on ("_package"))
  ))