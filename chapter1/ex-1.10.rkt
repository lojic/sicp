#lang sicp

;; Exercise 1.10

(define (A x y)
  (cond [ (= y 0) 0       ]
        [ (= x 0) (* 2 y) ]
        [ (= y 1) 2       ]
        [else (A (- x 1)
                 (A x (- y 1))) ]))

;(A 1 10)
;(A 2 4)
;(A 3 3)

;; f(n) ==> 2 * n
(define (f n) (A 0 n))

;; g(n) ==> 2 ^ n, for positive n
(define (g n) (A 1 n))

;; h(1) = 2
;; h(n) = 2 ^ h(n-1) 
(define (h n) (A 2 n))

;(h 0)
;(h 1)
;(h 2)
;(h 3)
;(h 4)
;(expt 2 (h 3))

