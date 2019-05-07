; Auto-generated. Do not edit!


(cl:in-package imu_driver-srv)


;//! \htmlinclude Angle-request.msg.html

(cl:defclass <Angle-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Angle-request (<Angle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Angle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Angle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_driver-srv:<Angle-request> is deprecated: use imu_driver-srv:Angle-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Angle-request>) ostream)
  "Serializes a message object of type '<Angle-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Angle-request>) istream)
  "Deserializes a message object of type '<Angle-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Angle-request>)))
  "Returns string type for a service object of type '<Angle-request>"
  "imu_driver/AngleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Angle-request)))
  "Returns string type for a service object of type 'Angle-request"
  "imu_driver/AngleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Angle-request>)))
  "Returns md5sum for a message object of type '<Angle-request>"
  "a46ad9d1acd29c33849f4ca4e749a514")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Angle-request)))
  "Returns md5sum for a message object of type 'Angle-request"
  "a46ad9d1acd29c33849f4ca4e749a514")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Angle-request>)))
  "Returns full string definition for message of type '<Angle-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Angle-request)))
  "Returns full string definition for message of type 'Angle-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Angle-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Angle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Angle-request
))
;//! \htmlinclude Angle-response.msg.html

(cl:defclass <Angle-response> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (std_dev_ang
    :reader std_dev_ang
    :initarg :std_dev_ang
    :type cl:float
    :initform 0.0)
   (omega
    :reader omega
    :initarg :omega
    :type cl:float
    :initform 0.0)
   (std_dev_omega
    :reader std_dev_omega
    :initarg :std_dev_omega
    :type cl:float
    :initform 0.0))
)

(cl:defclass Angle-response (<Angle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Angle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Angle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_driver-srv:<Angle-response> is deprecated: use imu_driver-srv:Angle-response instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <Angle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:angle-val is deprecated.  Use imu_driver-srv:angle instead.")
  (angle m))

(cl:ensure-generic-function 'std_dev_ang-val :lambda-list '(m))
(cl:defmethod std_dev_ang-val ((m <Angle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:std_dev_ang-val is deprecated.  Use imu_driver-srv:std_dev_ang instead.")
  (std_dev_ang m))

(cl:ensure-generic-function 'omega-val :lambda-list '(m))
(cl:defmethod omega-val ((m <Angle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:omega-val is deprecated.  Use imu_driver-srv:omega instead.")
  (omega m))

(cl:ensure-generic-function 'std_dev_omega-val :lambda-list '(m))
(cl:defmethod std_dev_omega-val ((m <Angle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_driver-srv:std_dev_omega-val is deprecated.  Use imu_driver-srv:std_dev_omega instead.")
  (std_dev_omega m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Angle-response>) ostream)
  "Serializes a message object of type '<Angle-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'std_dev_ang))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'omega))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'std_dev_omega))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Angle-response>) istream)
  "Deserializes a message object of type '<Angle-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'std_dev_ang) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'omega) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'std_dev_omega) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Angle-response>)))
  "Returns string type for a service object of type '<Angle-response>"
  "imu_driver/AngleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Angle-response)))
  "Returns string type for a service object of type 'Angle-response"
  "imu_driver/AngleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Angle-response>)))
  "Returns md5sum for a message object of type '<Angle-response>"
  "a46ad9d1acd29c33849f4ca4e749a514")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Angle-response)))
  "Returns md5sum for a message object of type 'Angle-response"
  "a46ad9d1acd29c33849f4ca4e749a514")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Angle-response>)))
  "Returns full string definition for message of type '<Angle-response>"
  (cl:format cl:nil "float64 angle~%float64 std_dev_ang~%float64 omega~%float64 std_dev_omega~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Angle-response)))
  "Returns full string definition for message of type 'Angle-response"
  (cl:format cl:nil "float64 angle~%float64 std_dev_ang~%float64 omega~%float64 std_dev_omega~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Angle-response>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Angle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Angle-response
    (cl:cons ':angle (angle msg))
    (cl:cons ':std_dev_ang (std_dev_ang msg))
    (cl:cons ':omega (omega msg))
    (cl:cons ':std_dev_omega (std_dev_omega msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Angle)))
  'Angle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Angle)))
  'Angle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Angle)))
  "Returns string type for a service object of type '<Angle>"
  "imu_driver/Angle")