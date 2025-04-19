;; Auto-generated. Do not edit!


(when (boundp 'bot::BotPose)
  (if (not (find-package "BOT"))
    (make-package "BOT"))
  (shadow 'BotPose (find-package "BOT")))
(unless (find-package "BOT::BOTPOSE")
  (make-package "BOT::BOTPOSE"))

(in-package "ROS")
;;//! \htmlinclude BotPose.msg.html


(defclass bot::BotPose
  :super ros::object
  :slots (_x _y _direction ))

(defmethod bot::BotPose
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:direction __direction) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _direction (string __direction))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; string _direction
    4 (length _direction)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get bot::BotPose :md5sum-) "9fe0bb04457256f44c3856c153b539c2")
(setf (get bot::BotPose :datatype-) "bot/BotPose")
(setf (get bot::BotPose :definition-)
      "float32 x
float32 y
string direction

")



(provide :bot/BotPose "9fe0bb04457256f44c3856c153b539c2")


