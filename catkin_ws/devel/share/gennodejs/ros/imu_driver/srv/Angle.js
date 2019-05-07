// Auto-generated. Do not edit!

// (in-package imu_driver.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class AngleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AngleRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AngleRequest
    let len;
    let data = new AngleRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'imu_driver/AngleRequest';
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
    const resolved = new AngleRequest(null);
    return resolved;
    }
};

class AngleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angle = null;
      this.std_dev_ang = null;
      this.omega = null;
      this.std_dev_omega = null;
    }
    else {
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
      if (initObj.hasOwnProperty('std_dev_ang')) {
        this.std_dev_ang = initObj.std_dev_ang
      }
      else {
        this.std_dev_ang = 0.0;
      }
      if (initObj.hasOwnProperty('omega')) {
        this.omega = initObj.omega
      }
      else {
        this.omega = 0.0;
      }
      if (initObj.hasOwnProperty('std_dev_omega')) {
        this.std_dev_omega = initObj.std_dev_omega
      }
      else {
        this.std_dev_omega = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AngleResponse
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    // Serialize message field [std_dev_ang]
    bufferOffset = _serializer.float64(obj.std_dev_ang, buffer, bufferOffset);
    // Serialize message field [omega]
    bufferOffset = _serializer.float64(obj.omega, buffer, bufferOffset);
    // Serialize message field [std_dev_omega]
    bufferOffset = _serializer.float64(obj.std_dev_omega, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AngleResponse
    let len;
    let data = new AngleResponse(null);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [std_dev_ang]
    data.std_dev_ang = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [omega]
    data.omega = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [std_dev_omega]
    data.std_dev_omega = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a service object
    return 'imu_driver/AngleResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a46ad9d1acd29c33849f4ca4e749a514';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 angle
    float64 std_dev_ang
    float64 omega
    float64 std_dev_omega
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AngleResponse(null);
    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    if (msg.std_dev_ang !== undefined) {
      resolved.std_dev_ang = msg.std_dev_ang;
    }
    else {
      resolved.std_dev_ang = 0.0
    }

    if (msg.omega !== undefined) {
      resolved.omega = msg.omega;
    }
    else {
      resolved.omega = 0.0
    }

    if (msg.std_dev_omega !== undefined) {
      resolved.std_dev_omega = msg.std_dev_omega;
    }
    else {
      resolved.std_dev_omega = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: AngleRequest,
  Response: AngleResponse,
  md5sum() { return 'a46ad9d1acd29c33849f4ca4e749a514'; },
  datatype() { return 'imu_driver/Angle'; }
};
