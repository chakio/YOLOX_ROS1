// Auto-generated. Do not edit!

// (in-package yolox_ros_wrapper_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class YoloxDetectedObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.class_name = null;
      this.class_id = null;
      this.score = null;
      this.x0 = null;
      this.x1 = null;
      this.y0 = null;
      this.y1 = null;
      this.image_width = null;
      this.image_height = null;
    }
    else {
      if (initObj.hasOwnProperty('class_name')) {
        this.class_name = initObj.class_name
      }
      else {
        this.class_name = '';
      }
      if (initObj.hasOwnProperty('class_id')) {
        this.class_id = initObj.class_id
      }
      else {
        this.class_id = 0;
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
      }
      if (initObj.hasOwnProperty('x0')) {
        this.x0 = initObj.x0
      }
      else {
        this.x0 = 0;
      }
      if (initObj.hasOwnProperty('x1')) {
        this.x1 = initObj.x1
      }
      else {
        this.x1 = 0;
      }
      if (initObj.hasOwnProperty('y0')) {
        this.y0 = initObj.y0
      }
      else {
        this.y0 = 0;
      }
      if (initObj.hasOwnProperty('y1')) {
        this.y1 = initObj.y1
      }
      else {
        this.y1 = 0;
      }
      if (initObj.hasOwnProperty('image_width')) {
        this.image_width = initObj.image_width
      }
      else {
        this.image_width = 0;
      }
      if (initObj.hasOwnProperty('image_height')) {
        this.image_height = initObj.image_height
      }
      else {
        this.image_height = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type YoloxDetectedObject
    // Serialize message field [class_name]
    bufferOffset = _serializer.string(obj.class_name, buffer, bufferOffset);
    // Serialize message field [class_id]
    bufferOffset = _serializer.int32(obj.class_id, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float32(obj.score, buffer, bufferOffset);
    // Serialize message field [x0]
    bufferOffset = _serializer.int32(obj.x0, buffer, bufferOffset);
    // Serialize message field [x1]
    bufferOffset = _serializer.int32(obj.x1, buffer, bufferOffset);
    // Serialize message field [y0]
    bufferOffset = _serializer.int32(obj.y0, buffer, bufferOffset);
    // Serialize message field [y1]
    bufferOffset = _serializer.int32(obj.y1, buffer, bufferOffset);
    // Serialize message field [image_width]
    bufferOffset = _serializer.int32(obj.image_width, buffer, bufferOffset);
    // Serialize message field [image_height]
    bufferOffset = _serializer.int32(obj.image_height, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type YoloxDetectedObject
    let len;
    let data = new YoloxDetectedObject(null);
    // Deserialize message field [class_name]
    data.class_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [class_id]
    data.class_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [x0]
    data.x0 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [x1]
    data.x1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [y0]
    data.y0 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [y1]
    data.y1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [image_width]
    data.image_width = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [image_height]
    data.image_height = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.class_name);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolox_ros_wrapper_msgs/YoloxDetectedObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '44c56aadd6a52be9f308b0035f12dded';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new YoloxDetectedObject(null);
    if (msg.class_name !== undefined) {
      resolved.class_name = msg.class_name;
    }
    else {
      resolved.class_name = ''
    }

    if (msg.class_id !== undefined) {
      resolved.class_id = msg.class_id;
    }
    else {
      resolved.class_id = 0
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
    }

    if (msg.x0 !== undefined) {
      resolved.x0 = msg.x0;
    }
    else {
      resolved.x0 = 0
    }

    if (msg.x1 !== undefined) {
      resolved.x1 = msg.x1;
    }
    else {
      resolved.x1 = 0
    }

    if (msg.y0 !== undefined) {
      resolved.y0 = msg.y0;
    }
    else {
      resolved.y0 = 0
    }

    if (msg.y1 !== undefined) {
      resolved.y1 = msg.y1;
    }
    else {
      resolved.y1 = 0
    }

    if (msg.image_width !== undefined) {
      resolved.image_width = msg.image_width;
    }
    else {
      resolved.image_width = 0
    }

    if (msg.image_height !== undefined) {
      resolved.image_height = msg.image_height;
    }
    else {
      resolved.image_height = 0
    }

    return resolved;
    }
};

module.exports = YoloxDetectedObject;
