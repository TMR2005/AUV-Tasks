
(cl:in-package :asdf)

(defsystem "bot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BotPose" :depends-on ("_package_BotPose"))
    (:file "_package_BotPose" :depends-on ("_package"))
  ))