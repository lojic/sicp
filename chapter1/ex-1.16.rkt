#lang sicp

;; Exercise 1.16
;; Make use of the fact that (b ^ n/2) ^ 2 = (b ^ 2) ^ n/2 to design an iterative algorithm
;; that uses successive squaring to compute exponentiation.

(define (fast-expt b n)
  (let loop ([b b] [n n] [a 1])
    (cond [ (= n 0)   a                              ]
          [ (even? n) (loop (* b b) (/ n 2) a)       ]
          [ else      (loop b       (- n 1) (* a b)) ])))

(fast-expt 2 10) ; 1024