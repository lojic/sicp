#lang sicp

(#%require racket/base)
(#%require racket/function)

;; Exercise 1.29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; Compute integral using Simpson's rule
(define (integral f a b m)
  (define n        (if (even? m) m (+ m 1))) ; Add 1 to make even if necessary
  (define h        (/ (- b a) n))
  (define (y k)    (f (+ a (* k h))))
  (define add2     (curry + 2))
  (define (term x) (λ (k) (* x (y k))))
      
  (* (/ h 3)
     (+ (y 0)
        (sum (term 4) 1 add2 (- n 1)) ; Odd terms
        (sum (term 2) 2 add2 (- n 2)) ; Even terms
        (y n))))

(define (cube n) (* n n n))

;; 1.98999249660134
(integral sin 0 3 1000)

;; 1/4
(integral cube 0 1 2)
