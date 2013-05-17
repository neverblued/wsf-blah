;; (c) mail@neverblued.info
;; http://opensource.franz.com/license.html

(in-package #:wsf-blah)

(defgeneric server-default-language (blah-server))
(defgeneric server-dictionary-pathname (blah-server))

(defclass blah-server (docroot-server)
  ((default-language :initarg :default-language
                     :initform :*
                     :accessor server-default-language)))

(defmethod respond ((this blah-server) request)
  (with-dictionary (server-dictionary-pathname this)
    (in-language (server-default-language this)
      (call-next-method))))

(defmethod server-dictionary-pathname ((this blah-server))
  (with-server this
    (docroot/ (format nil (server-data-pathname-format this) "dictionary"))))
