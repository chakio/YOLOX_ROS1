// Auto-generated. Do not edit!

// (in-package yolox_ros_wrapper_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let YoloxDetectedObject = require('./YoloxDetectedObject.js');

//-----------------------------------------------------------

class YoloxOutput {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detected_objects = null;
    }
    else {
      if (initObj.hasOwnProperty('detected_objects')) {
        this.detected_objects = initObj.detected_objects
      }
      else {
        this.detected_objects = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type YoloxOutput
    // Serialize message field [detected_objects]
    // Serialize the length for message field [detected_objects]
    bufferOffset = _serializer.uint32(obj.detected_objects.length, buffer, bufferOffset);
    obj.detected_objects.forEach((val) => {
      bufferOffset = YoloxDetectedObject.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type YoloxOutput
    let len;
    let data = new YoloxOutput(null);
    // Deserialize message field [detected_objects]
    // Deserialize array length for message field [detected_objects]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.detected_objects = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.detected_objects[i] = YoloxDetectedObject.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.detected_objects.forEach((val) => {
      length += YoloxDetectedObject.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolox_ros_wrapper_msgs/YoloxOutput';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b9b9a86cebc49e7b022259f40e43d47d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    yolox_ros_wrapper_msgs/YoloxDetectedObject[] detected_objects
    ================================================================================
    MSG: yolox_ros_wrapper_msgs/YoloxDetectedObject
    string                                              class_name
    int32                                               class_id
    float32                                             score
    int32                                               x0
    int32                                               x1
    int32                                               y0
    int32                                               y1
    int32                                               image_width
    int32                                               image_height
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new YoloxOutput(null);
    if (msg.detected_objects !== undefined) {
      resolved.detected_objects = new Array(msg.detected_objects.length);
      for (let i = 0; i < resolved.detected_objects.length; ++i) {
        resolved.detected_objects[i] = YoloxDetectedObject.Resolve(msg.detected_objects[i]);
      }
    }
    else {
      resolved.detected_objects = []
    }

    return resolved;
    }
};

module.exports = YoloxOutput;
