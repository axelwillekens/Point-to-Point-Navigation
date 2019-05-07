// Auto-generated. Do not edit!

// (in-package drive_controller.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class GetThetaRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetThetaRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetThetaRequest
    let len;
    let data = new GetThetaRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'drive_controller/GetThetaRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetThetaRequest(null);
    return resolved;
    }
};

class GetThetaResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Theta = null;
    }
    else {
      if (initObj.hasOwnProperty('Theta')) {
        this.Theta = initObj.Theta
      }
      else {
        this.Theta = new std_msgs.msg.Float64();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetThetaResponse
    // Serialize message field [Theta]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.Theta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetThetaResponse
    let len;
    let data = new GetThetaResponse(null);
    // Deserialize message field [Theta]
    data.Theta = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'drive_controller/GetThetaResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4657e14e2a2d8f2699f1878ab10ffbed';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Float64 Theta
    
    
    ================================================================================
    MSG: std_msgs/Float64
    float64 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetThetaResponse(null);
    if (msg.Theta !== undefined) {
      resolved.Theta = std_msgs.msg.Float64.Resolve(msg.Theta)
    }
    else {
      resolved.Theta = new std_msgs.msg.Float64()
    }

    return resolved;
    }
};

module.exports = {
  Request: GetThetaRequest,
  Response: GetThetaResponse,
  md5sum() { return '4657e14e2a2d8f2699f1878ab10ffbed'; },
  datatype() { return 'drive_controller/GetTheta'; }
};
