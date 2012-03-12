Web Site Framework language module
==================================

Файл "/path/to/lisp/test/data/dictionary.lisp":

```cl
(
  (:hello :english "Hello"
          :russian "Привет"
          :udaff "Превед")
)
```

Привет

```cl
(defparameter speaker
  (make-instance 'blah-server :system '#:test :default-language :russian))
  
(defmethod respond ((server (eql speaker)) request)
  (say :hello))
```
