#lang sicp

;; Exercise 1.32
;; Show that accumulate is a general abstraction
;; from which product and sum can be built.

;; Linerar recursive version
(define (accumulate-r combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-r combiner null-value term (next a) next b))))

;; Iterative version
(define (accumulate-i combiner null-value term a next b)
  (let loop ([a a] [result null-value])
    (if (> a b)
        result
        (loop (next a) (combiner (term a)
                                 result)))))

(define accumulate accumulate-i)

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (fac n)
  (product identity 1 inc n))

;; Tests

(#%require rackunit)

(check-equal? (product identity 1 inc 5) 120)
(check-equal? (fac 10) 3628800)

(define (cube n) (* n n n))

(check-equal? (sum cube 1 inc 10) 3025)
(check-equal? (sum identity 1 inc 10) 55)