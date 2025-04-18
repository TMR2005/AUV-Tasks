; Auto-generated. Do not edit!


(cl:in-package chat_app-msg)


;//! \htmlinclude ChatMsg.msg.html

(cl:defclass <ChatMsg> (roslisp-msg-protocol:ros-message)
  ((username
    :reader username
    :initarg :username
    :type cl:string
    :initform "")
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ChatMsg (<ChatMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChatMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChatMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chat_app-msg:<ChatMsg> is deprecated: use chat_app-msg:ChatMsg instead.")))

(cl:ensure-generic-function 'username-val :lambda-list '(m))
(cl:defmethod username-val ((m <ChatMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chat_app-msg:username-val is deprecated.  Use chat_app-msg:username instead.")
  (username m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ChatMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chat_app-msg:message-val is deprecated.  Use chat_app-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChatMsg>) ostream)
  "Serializes a message object of type '<ChatMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'username))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'username))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChatMsg>) istream)
  "Deserializes a message object of type '<ChatMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'username) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'username) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChatMsg>)))
  "Returns string type for a message object of type '<ChatMsg>"
  "chat_app/ChatMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChatMsg)))
  "Returns string type for a message object of type 'ChatMsg"
  "chat_app/ChatMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChatMsg>)))
  "Returns md5sum for a message object of type '<ChatMsg>"
  "5c10ce50aab5101b9e0de49c059d28c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChatMsg)))
  "Returns md5sum for a message object of type 'ChatMsg"
  "5c10ce50aab5101b9e0de49c059d28c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChatMsg>)))
  "Returns full string definition for message of type '<ChatMsg>"
  (cl:format cl:nil "string username~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChatMsg)))
  "Returns full string definition for message of type 'ChatMsg"
  (cl:format cl:nil "string username~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChatMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'username))
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChatMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ChatMsg
    (cl:cons ':username (username msg))
    (cl:cons ':message (message msg))
))
