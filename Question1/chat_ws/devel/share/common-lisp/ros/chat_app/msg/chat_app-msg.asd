
(cl:in-package :asdf)

(defsystem "chat_app-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ChatMsg" :depends-on ("_package_ChatMsg"))
    (:file "_package_ChatMsg" :depends-on ("_package"))
  ))