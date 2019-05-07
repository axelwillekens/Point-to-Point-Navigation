
(cl:in-package :asdf)

(defsystem "point_creator-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetPoint" :depends-on ("_package_GetPoint"))
    (:file "_package_GetPoint" :depends-on ("_package"))
  ))