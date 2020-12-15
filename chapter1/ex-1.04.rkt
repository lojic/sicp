#lang sicp

;; Exercise 1.4
;; If b is positive, use the + operator; otherwise, use the - operator
;; in the expression: (<operator> a b)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;(a-plus-abs-b 3 4)
;(a-plus-abs-b 3 -4)
;(a-plus-abs-b -2 3)
;(a-plus-abs-b -2 -3)
