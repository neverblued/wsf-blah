;; (c) mail@neverblued.info
;; http://opensource.franz.com/license.html

(defpackage #:wsf-blah-system
  (:use #:common-lisp #:asdf))

(in-package #:wsf-blah-system)

(defsystem "wsf-blah"
  :version "0.2"
  :depends-on (#:wsf #:blah)
  :serial t
  :components ((:file "package")
	       (:file "server")))
