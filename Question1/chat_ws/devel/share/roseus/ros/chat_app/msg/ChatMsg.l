;; Auto-generated. Do not edit!


(when (boundp 'chat_app::ChatMsg)
  (if (not (find-package "CHAT_APP"))
    (make-package "CHAT_APP"))
  (shadow 'ChatMsg (find-package "CHAT_APP")))
(unless (find-package "CHAT_APP::CHATMSG")
  (make-package "CHAT_APP::CHATMSG"))

(in-package "ROS")
;;//! \htmlinclude ChatMsg.msg.html


(defclass chat_app::ChatMsg
  :super ros::object
  :slots (_username _message ))

(defmethod chat_app::ChatMsg
  (:init
   (&key
    ((:username __username) "")
    ((:message __message) "")
    )
   (send-super :init)
   (setq _username (string __username))
   (setq _message (string __message))
   self)
  (:username
   (&optional __username)
   (if __username (setq _username __username)) _username)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _username
    4 (length _username)
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _username
       (write-long (length _username) s) (princ _username s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _username
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _username (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get chat_app::ChatMsg :md5sum-) "5c10ce50aab5101b9e0de49c059d28c8")
(setf (get chat_app::ChatMsg :datatype-) "chat_app/ChatMsg")
(setf (get chat_app::ChatMsg :definition-)
      "string username
string message

")



(provide :chat_app/ChatMsg "5c10ce50aab5101b9e0de49c059d28c8")


