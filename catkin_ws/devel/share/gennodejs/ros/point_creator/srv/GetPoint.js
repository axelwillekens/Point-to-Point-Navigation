// Auto-generated. Do not edit!

// (in-package point_creator.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetPointRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.theta = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPointRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = _serializer.float64(obj.theta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPointRequest
    let len;
    let data = new GetPointRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'point_creator/GetPointRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '938fa65709584ad8e77d238529be13b8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 theta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPointRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.theta !== undefined) {
      resolved.theta = msg.theta;
    }
    else {
      resolved.theta = 0.0
    }

    return resolved;
    }
};

class GetPointResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_e = null;
      this.y_e = null;
      this.theta_e = null;
    }
    else {
      if (initObj.hasOwnProperty('x_e')) {
        this.x_e = initObj.x_e
      }
      else {
        this.x_e = 0.0;
      }
      if (initObj.hasOwnProperty('y_e')) {
        this.y_e = initObj.y_e
      }
      else {
        this.y_e = 0.0;
      }
      if (initObj.hasOwnProperty('theta_e')) {
        this.theta_e = initObj.theta_e
      }
      else {
        this.theta_e = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPointResponse
    // Serialize message field [x_e]
    bufferOffset = _serializer.float64(obj.x_e, buffer, bufferOffset);
    // Serialize message field [y_e]
    bufferOffset = _serializer.float64(obj.y_e, buffer, bufferOffset);
    // Serialize message field [theta_e]
    bufferOffset = _serializer.float64(obj.theta_e, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPointResponse
    let len;
    let data = new GetPointResponse(null);
    // Deserialize message field [x_e]
    data.x_e = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_e]
    data.y_e = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta_e]
    data.theta_e = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'point_creator/GetPointResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c342c6a3d9a39d7f7237a3878c0801ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x_e
    float64 y_e
    float64 theta_e
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPointResponse(null);
    if (msg.x_e !== undefined) {
      resolved.x_e = msg.x_e;
    }
    else {
      resolved.x_e = 0.0
    }

    if (msg.y_e !== undefined) {
      resolved.y_e = msg.y_e;
    }
    else {
      resolved.y_e = 0.0
    }

    if (msg.theta_e !== undefined) {
      resolved.theta_e = msg.theta_e;
    }
    else {
      resolved.theta_e = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetPointRequest,
  Response: GetPointResponse,
  md5sum() { return '54e2ac5f870ad872ea553cca86512c19'; },
  datatype() { return 'point_creator/GetPoint'; }
};
