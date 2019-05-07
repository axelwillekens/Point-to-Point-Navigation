;; Auto-generated. Do not edit!


(when (boundp 'imu_driver::Angle)
  (if (not (find-package "IMU_DRIVER"))
    (make-package "IMU_DRIVER"))
  (shadow 'Angle (find-package "IMU_DRIVER")))
(unless (find-package "IMU_DRIVER::ANGLE")
  (make-package "IMU_DRIVER::ANGLE"))
(unless (find-package "IMU_DRIVER::ANGLEREQUEST")
  (make-package "IMU_DRIVER::ANGLEREQUEST"))
(unless (find-package "IMU_DRIVER::ANGLERESPONSE")
  (make-package "IMU_DRIVER::ANGLERESPONSE"))

(in-package "ROS")





(defclass imu_driver::AngleRequest
  :super ros::object
  :slots ())

(defmethod imu_driver::AngleRequest
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

(defclass imu_driver::AngleResponse
  :super ros::object
  :slots (_angle _std_dev_ang _omega _std_dev_omega ))

(defmethod imu_driver::AngleResponse
  (:init
   (&key
    ((:angle __angle) 0.0)
    ((:std_dev_ang __std_dev_ang) 0.0)
    ((:omega __omega) 0.0)
    ((:std_dev_omega __std_dev_omega) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   (setq _std_dev_ang (float __std_dev_ang))
   (setq _omega (float __omega))
   (setq _std_dev_omega (float __std_dev_omega))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:std_dev_ang
   (&optional __std_dev_ang)
   (if __std_dev_ang (setq _std_dev_ang __std_dev_ang)) _std_dev_ang)
  (:omega
   (&optional __omega)
   (if __omega (setq _omega __omega)) _omega)
  (:std_dev_omega
   (&optional __std_dev_omega)
   (if __std_dev_omega (setq _std_dev_omega __std_dev_omega)) _std_dev_omega)
  (:serialization-length
   ()
   (+
    ;; float64 _angle
    8
    ;; float64 _std_dev_ang
    8
    ;; float64 _omega
    8
    ;; float64 _std_dev_omega
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _std_dev_ang
       (sys::poke _std_dev_ang (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _omega
       (sys::poke _omega (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _std_dev_omega
       (sys::poke _std_dev_omega (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _std_dev_ang
     (setq _std_dev_ang (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _omega
     (setq _omega (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _std_dev_omega
     (setq _std_dev_omega (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass imu_driver::Angle
  :super ros::object
  :slots ())

(setf (get imu_driver::Angle :md5sum-) "a46ad9d1acd29c33849f4ca4e749a514")
(setf (get imu_driver::Angle :datatype-) "imu_driver/Angle")
(setf (get imu_driver::Angle :request) imu_driver::AngleRequest)
(setf (get imu_driver::Angle :response) imu_driver::AngleResponse)

(defmethod imu_driver::AngleRequest
  (:response () (instance imu_driver::AngleResponse :init)))

(setf (get imu_driver::AngleRequest :md5sum-) "a46ad9d1acd29c33849f4ca4e749a514")
(setf (get imu_driver::AngleRequest :datatype-) "imu_driver/AngleRequest")
(setf (get imu_driver::AngleRequest :definition-)
      "---
float64 angle
float64 std_dev_ang
float64 omega
float64 std_dev_omega

")

(setf (get imu_driver::AngleResponse :md5sum-) "a46ad9d1acd29c33849f4ca4e749a514")
(setf (get imu_driver::AngleResponse :datatype-) "imu_driver/AngleResponse")
(setf (get imu_driver::AngleResponse :definition-)
      "---
float64 angle
float64 std_dev_ang
float64 omega
float64 std_dev_omega

")



(provide :imu_driver/Angle "a46ad9d1acd29c33849f4ca4e749a514")


