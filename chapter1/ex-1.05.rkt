#lang sicp

;; Exercise 1.5
;; With aplicative order (i.e. used by Racket), we'll infinitely recurse.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))