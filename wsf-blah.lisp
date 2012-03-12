;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:wsf)

(defclass blah-server (docroot-server)
  ((dictionary-pathname :initarg :dictionary-pathname
                        :initform "data/dictionary.lisp"
                        :accessor server-dictionary-pathname)
   (default-language :initarg :default-language
                     :initform :*
                     :accessor server-default-language)))

(defmethod respond ((server blah-server) request)
  (blah:with-dictionary (from-docroot server (server-dictionary-pathname server))
    (blah:with-language (server-default-language server)
      (call-next-method))))

(export '(blah-server server-dictionary-pathname server-default-language))