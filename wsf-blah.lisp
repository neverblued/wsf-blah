;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:wsf)

(defgeneric server-default-language (blah-server))
(defgeneric server-dictionary-pathname (blah-server))

(defclass blah-server (docroot-server)
  ((default-language :initarg :default-language
                     :initform :*
                     :accessor server-default-language)))

(defmethod respond ((server blah-server) request)
  (blah:with-dictionary (server-dictionary-pathname server)
    (blah:in-language (server-default-language server)
      (call-next-method))))

(defmethod server-dictionary-pathname ((server blah-server))
  (with-server server
    (docroot/ (format nil (server-data-pathname-format server) "dictionary"))))

(export '(blah-server server-dictionary-pathname server-default-language))