#lang sicp

;; Exercise 1.3

(define (sum-of-squares-largest-2 a b c)
  (define (square x) (* x x))
  
  (define (sum-of-squares a b)
    (+ (square a) (square b)))

  (define (largest-2 a b c)
    (if (>= a b)
        (if (>= b c)
            (list a b)
            (list a c))
        (if (>= a c)
            (list b a)
            (list b c))))

  (apply sum-of-squares (largest-2 a b c)))

;(sum-of-squares-largest-2 2 3 4) ; 25
;(sum-of-squares-largest-2 3 4 5) ; 41
;(sum-of-squares-largest-2 4 3 2) ; 25
;(sum-of-squares-largest-2 5 4 3) ; 41
;(sum-of-squares-largest-2 4 5 3) ; 41
;(sum-of-squares-largest-2 3 2 4) ; 25