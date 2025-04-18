// Auto-generated. Do not edit!

// (in-package chat_app.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ChatMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.username = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('username')) {
        this.username = initObj.username
      }
      else {
        this.username = '';
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChatMsg
    // Serialize message field [username]
    bufferOffset = _serializer.string(obj.username, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChatMsg
    let len;
    let data = new ChatMsg(null);
    // Deserialize message field [username]
    data.username = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.username);
    length += _getByteLength(object.message);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'chat_app/ChatMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5c10ce50aab5101b9e0de49c059d28c8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string username
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChatMsg(null);
    if (msg.username !== undefined) {
      resolved.username = msg.username;
    }
    else {
      resolved.username = ''
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = ChatMsg;
