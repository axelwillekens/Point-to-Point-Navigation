; Auto-generated. Do not edit!


(cl:in-package drive_controller-srv)


;//! \htmlinclude GetTheta-request.msg.html

(cl:defclass <GetTheta-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetTheta-request (<GetTheta-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTheta-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTheta-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drive_controller-srv:<GetTheta-request> is deprecated: use drive_controller-srv:GetTheta-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTheta-request>) ostream)
  "Serializes a message object of type '<GetTheta-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTheta-request>) istream)
  "Deserializes a message object of type '<GetTheta-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTheta-request>)))
  "Returns string type for a service object of type '<GetTheta-request>"
  "drive_controller/GetThetaRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTheta-request)))
  "Returns string type for a service object of type 'GetTheta-request"
  "drive_controller/GetThetaRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTheta-request>)))
  "Returns md5sum for a message object of type '<GetTheta-request>"
  "4657e14e2a2d8f2699f1878ab10ffbed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTheta-request)))
  "Returns md5sum for a message object of type 'GetTheta-request"
  "4657e14e2a2d8f2699f1878ab10ffbed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTheta-request>)))
  "Returns full string definition for message of type '<GetTheta-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTheta-request)))
  "Returns full string definition for message of type 'GetTheta-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTheta-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTheta-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTheta-request
))
;//! \htmlinclude GetTheta-response.msg.html

(cl:defclass <GetTheta-response> (roslisp-msg-protocol:ros-message)
  ((Theta
    :reader Theta
    :initarg :Theta
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64)))
)

(cl:defclass GetTheta-response (<GetTheta-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTheta-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTheta-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drive_controller-srv:<GetTheta-response> is deprecated: use drive_controller-srv:GetTheta-response instead.")))

(cl:ensure-generic-function 'Theta-val :lambda-list '(m))
(cl:defmethod Theta-val ((m <GetTheta-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drive_controller-srv:Theta-val is deprecated.  Use drive_controller-srv:Theta instead.")
  (Theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTheta-response>) ostream)
  "Serializes a message object of type '<GetTheta-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Theta) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTheta-response>) istream)
  "Deserializes a message object of type '<GetTheta-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Theta) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTheta-response>)))
  "Returns string type for a service object of type '<GetTheta-response>"
  "drive_controller/GetThetaResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTheta-response)))
  "Returns string type for a service object of type 'GetTheta-response"
  "drive_controller/GetThetaResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTheta-response>)))
  "Returns md5sum for a message object of type '<GetTheta-response>"
  "4657e14e2a2d8f2699f1878ab10ffbed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTheta-response)))
  "Returns md5sum for a message object of type 'GetTheta-response"
  "4657e14e2a2d8f2699f1878ab10ffbed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTheta-response>)))
  "Returns full string definition for message of type '<GetTheta-response>"
  (cl:format cl:nil "std_msgs/Float64 Theta~%~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTheta-response)))
  "Returns full string definition for message of type 'GetTheta-response"
  (cl:format cl:nil "std_msgs/Float64 Theta~%~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTheta-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Theta))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTheta-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTheta-response
    (cl:cons ':Theta (Theta msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetTheta)))
  'GetTheta-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetTheta)))
  'GetTheta-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTheta)))
  "Returns string type for a service object of type '<GetTheta>"
  "drive_controller/GetTheta")