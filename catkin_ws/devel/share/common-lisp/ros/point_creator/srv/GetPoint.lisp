; Auto-generated. Do not edit!


(cl:in-package point_creator-srv)


;//! \htmlinclude GetPoint-request.msg.html

(cl:defclass <GetPoint-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetPoint-request (<GetPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name point_creator-srv:<GetPoint-request> is deprecated: use point_creator-srv:GetPoint-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <GetPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_creator-srv:x-val is deprecated.  Use point_creator-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <GetPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_creator-srv:y-val is deprecated.  Use point_creator-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <GetPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_creator-srv:theta-val is deprecated.  Use point_creator-srv:theta instead.")
  (theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPoint-request>) ostream)
  "Serializes a message object of type '<GetPoint-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPoint-request>) istream)
  "Deserializes a message object of type '<GetPoint-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPoint-request>)))
  "Returns string type for a service object of type '<GetPoint-request>"
  "point_creator/GetPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoint-request)))
  "Returns string type for a service object of type 'GetPoint-request"
  "point_creator/GetPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPoint-request>)))
  "Returns md5sum for a message object of type '<GetPoint-request>"
  "54e2ac5f870ad872ea553cca86512c19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPoint-request)))
  "Returns md5sum for a message object of type 'GetPoint-request"
  "54e2ac5f870ad872ea553cca86512c19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPoint-request>)))
  "Returns full string definition for message of type '<GetPoint-request>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPoint-request)))
  "Returns full string definition for message of type 'GetPoint-request"
  (cl:format cl:nil "float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPoint-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPoint-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
))
;//! \htmlinclude GetPoint-response.msg.html

(cl:defclass <GetPoint-response> (roslisp-msg-protocol:ros-message)
  ((x_e
    :reader x_e
    :initarg :x_e
    :type cl:float
    :initform 0.0)
   (y_e
    :reader y_e
    :initarg :y_e
    :type cl:float
    :initform 0.0)
   (theta_e
    :reader theta_e
    :initarg :theta_e
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetPoint-response (<GetPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name point_creator-srv:<GetPoint-response> is deprecated: use point_creator-srv:GetPoint-response instead.")))

(cl:ensure-generic-function 'x_e-val :lambda-list '(m))
(cl:defmethod x_e-val ((m <GetPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_creator-srv:x_e-val is deprecated.  Use point_creator-srv:x_e instead.")
  (x_e m))

(cl:ensure-generic-function 'y_e-val :lambda-list '(m))
(cl:defmethod y_e-val ((m <GetPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_creator-srv:y_e-val is deprecated.  Use point_creator-srv:y_e instead.")
  (y_e m))

(cl:ensure-generic-function 'theta_e-val :lambda-list '(m))
(cl:defmethod theta_e-val ((m <GetPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader point_creator-srv:theta_e-val is deprecated.  Use point_creator-srv:theta_e instead.")
  (theta_e m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPoint-response>) ostream)
  "Serializes a message object of type '<GetPoint-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x_e))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y_e))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'theta_e))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPoint-response>) istream)
  "Deserializes a message object of type '<GetPoint-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_e) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_e) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta_e) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPoint-response>)))
  "Returns string type for a service object of type '<GetPoint-response>"
  "point_creator/GetPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoint-response)))
  "Returns string type for a service object of type 'GetPoint-response"
  "point_creator/GetPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPoint-response>)))
  "Returns md5sum for a message object of type '<GetPoint-response>"
  "54e2ac5f870ad872ea553cca86512c19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPoint-response)))
  "Returns md5sum for a message object of type 'GetPoint-response"
  "54e2ac5f870ad872ea553cca86512c19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPoint-response>)))
  "Returns full string definition for message of type '<GetPoint-response>"
  (cl:format cl:nil "float64 x_e~%float64 y_e~%float64 theta_e~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPoint-response)))
  "Returns full string definition for message of type 'GetPoint-response"
  (cl:format cl:nil "float64 x_e~%float64 y_e~%float64 theta_e~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPoint-response>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPoint-response
    (cl:cons ':x_e (x_e msg))
    (cl:cons ':y_e (y_e msg))
    (cl:cons ':theta_e (theta_e msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetPoint)))
  'GetPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetPoint)))
  'GetPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoint)))
  "Returns string type for a service object of type '<GetPoint>"
  "point_creator/GetPoint")