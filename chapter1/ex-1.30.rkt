#lang sicp

;; Exercise 1.30
;; Rewrite sum to be iterative instead of linear recursive.

(define (sum term a next b)
  (let loop ([a a] [result 0])
    (if (> a b)
        result
        (loop (next a) (+ (term a) 
                          result)))))

;; Tests

(#%require rackunit)

(define (cube n) (* n n n))

(check-equal? (sum cube 1 inc 10) 3025)

(check-equal? (sum identity 1 inc 10) 55)