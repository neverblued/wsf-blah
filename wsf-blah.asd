;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(defpackage #:wsf-blah-system
  (:use #:common-lisp #:asdf))

(in-package #:wsf-blah-system)

(defsystem "wsf-blah"
  :description "Web Site Framework language module"
  :version "0.1"
  :author "Дмитрий Пинский <demetrius@neverblued.info>"
  :depends-on (#:wsf #:blah)
  :serial t
  :components ((:file "wsf-blah")))
