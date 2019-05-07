;; Auto-generated. Do not edit!


(when (boundp 'drive_controller::GetTheta)
  (if (not (find-package "DRIVE_CONTROLLER"))
    (make-package "DRIVE_CONTROLLER"))
  (shadow 'GetTheta (find-package "DRIVE_CONTROLLER")))
(unless (find-package "DRIVE_CONTROLLER::GETTHETA")
  (make-package "DRIVE_CONTROLLER::GETTHETA"))
(unless (find-package "DRIVE_CONTROLLER::GETTHETAREQUEST")
  (make-package "DRIVE_CONTROLLER::GETTHETAREQUEST"))
(unless (find-package "DRIVE_CONTROLLER::GETTHETARESPONSE")
  (make-package "DRIVE_CONTROLLER::GETTHETARESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass drive_controller::GetThetaRequest
  :super ros::object
  :slots ())

(defmethod drive_controller::GetThetaRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass drive_controller::GetThetaResponse
  :super ros::object
  :slots (_Theta ))

(defmethod drive_controller::GetThetaResponse
  (:init
   (&key
    ((:Theta __Theta) (instance std_msgs::Float64 :init))
    )
   (send-super :init)
   (setq _Theta __Theta)
   self)
  (:Theta
   (&rest __Theta)
   (if (keywordp (car __Theta))
       (send* _Theta __Theta)
     (progn
       (if __Theta (setq _Theta (car __Theta)))
       _Theta)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float64 _Theta
    (send _Theta :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float64 _Theta
       (send _Theta :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float64 _Theta
     (send _Theta :deserialize buf ptr-) (incf ptr- (send _Theta :serialization-length))
   ;;
   self)
  )

(defclass drive_controller::GetTheta
  :super ros::object
  :slots ())

(setf (get drive_controller::GetTheta :md5sum-) "4657e14e2a2d8f2699f1878ab10ffbed")
(setf (get drive_controller::GetTheta :datatype-) "drive_controller/GetTheta")
(setf (get drive_controller::GetTheta :request) drive_controller::GetThetaRequest)
(setf (get drive_controller::GetTheta :response) drive_controller::GetThetaResponse)

(defmethod drive_controller::GetThetaRequest
  (:response () (instance drive_controller::GetThetaResponse :init)))

(setf (get drive_controller::GetThetaRequest :md5sum-) "4657e14e2a2d8f2699f1878ab10ffbed")
(setf (get drive_controller::GetThetaRequest :datatype-) "drive_controller/GetThetaRequest")
(setf (get drive_controller::GetThetaRequest :definition-)
      "---
std_msgs/Float64 Theta


================================================================================
MSG: std_msgs/Float64
")

(setf (get drive_controller::GetThetaResponse :md5sum-) "4657e14e2a2d8f2699f1878ab10ffbed")
(setf (get drive_controller::GetThetaResponse :datatype-) "drive_controller/GetThetaResponse")
(setf (get drive_controller::GetThetaResponse :definition-)
      "---
std_msgs/Float64 Theta


================================================================================
MSG: std_msgs/Float64
")



(provide :drive_controller/GetTheta "4657e14e2a2d8f2699f1878ab10ffbed")


