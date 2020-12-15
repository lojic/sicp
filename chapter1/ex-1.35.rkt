#lang sicp

;; Exercise 1.35

;; 1) Show that the golden ratio: (1 + sqrt(5)) / 2 is a 
;;    fixed point of the transformation: x -> 1 + 1 / x
;;
;;    Substituting the golden ratio for x above satisfies f(x) = 1 + 1 / x
;;
;; 2) Use this fact to compute the golden ratio by means of the fixed-point
;;    procedure.

(define tolerance 0.000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ([ next (f guess) ])
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(exact->inexact (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))
