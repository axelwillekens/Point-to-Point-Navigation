;; Auto-generated. Do not edit!


(when (boundp 'point_creator::GetPoint)
  (if (not (find-package "POINT_CREATOR"))
    (make-package "POINT_CREATOR"))
  (shadow 'GetPoint (find-package "POINT_CREATOR")))
(unless (find-package "POINT_CREATOR::GETPOINT")
  (make-package "POINT_CREATOR::GETPOINT"))
(unless (find-package "POINT_CREATOR::GETPOINTREQUEST")
  (make-package "POINT_CREATOR::GETPOINTREQUEST"))
(unless (find-package "POINT_CREATOR::GETPOINTRESPONSE")
  (make-package "POINT_CREATOR::GETPOINTRESPONSE"))

(in-package "ROS")





(defclass point_creator::GetPointRequest
  :super ros::object
  :slots (_x _y _theta ))

(defmethod point_creator::GetPointRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass point_creator::GetPointResponse
  :super ros::object
  :slots (_x_e _y_e _theta_e ))

(defmethod point_creator::GetPointResponse
  (:init
   (&key
    ((:x_e __x_e) 0.0)
    ((:y_e __y_e) 0.0)
    ((:theta_e __theta_e) 0.0)
    )
   (send-super :init)
   (setq _x_e (float __x_e))
   (setq _y_e (float __y_e))
   (setq _theta_e (float __theta_e))
   self)
  (:x_e
   (&optional __x_e)
   (if __x_e (setq _x_e __x_e)) _x_e)
  (:y_e
   (&optional __y_e)
   (if __y_e (setq _y_e __y_e)) _y_e)
  (:theta_e
   (&optional __theta_e)
   (if __theta_e (setq _theta_e __theta_e)) _theta_e)
  (:serialization-length
   ()
   (+
    ;; float64 _x_e
    8
    ;; float64 _y_e
    8
    ;; float64 _theta_e
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x_e
       (sys::poke _x_e (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_e
       (sys::poke _y_e (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_e
       (sys::poke _theta_e (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x_e
     (setq _x_e (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_e
     (setq _y_e (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_e
     (setq _theta_e (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass point_creator::GetPoint
  :super ros::object
  :slots ())

(setf (get point_creator::GetPoint :md5sum-) "54e2ac5f870ad872ea553cca86512c19")
(setf (get point_creator::GetPoint :datatype-) "point_creator/GetPoint")
(setf (get point_creator::GetPoint :request) point_creator::GetPointRequest)
(setf (get point_creator::GetPoint :response) point_creator::GetPointResponse)

(defmethod point_creator::GetPointRequest
  (:response () (instance point_creator::GetPointResponse :init)))

(setf (get point_creator::GetPointRequest :md5sum-) "54e2ac5f870ad872ea553cca86512c19")
(setf (get point_creator::GetPointRequest :datatype-) "point_creator/GetPointRequest")
(setf (get point_creator::GetPointRequest :definition-)
      "float64 x
float64 y
float64 theta
---
float64 x_e
float64 y_e
float64 theta_e

")

(setf (get point_creator::GetPointResponse :md5sum-) "54e2ac5f870ad872ea553cca86512c19")
(setf (get point_creator::GetPointResponse :datatype-) "point_creator/GetPointResponse")
(setf (get point_creator::GetPointResponse :definition-)
      "float64 x
float64 y
float64 theta
---
float64 x_e
float64 y_e
float64 theta_e

")



(provide :point_creator/GetPoint "54e2ac5f870ad872ea553cca86512c19")


