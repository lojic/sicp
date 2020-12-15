#lang sicp

(#%require racket)
(#%require rackunit)

;; Exercise 1.21
;; Use the smallest-divisor procedure to find the smallest divisor of each
;; of the following numbers: 199, 1999, 19999.
;; Answer => '(199 1999 7)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond [ (> (square test-divisor) n) n                    ]
        [ (divides? test-divisor n)   test-divisor         ]
        [ else                        (find-divisor 
                                       n 
                                       (+ test-divisor 1)) ]))

(define (divides? a b) (= (remainder b a) 0))

(define (square n) (* n n))

(map smallest-divisor '(199 1999 19999))

;; Tests
(for ([ pair (in-list '((0 0)
                        (1 1)
                        (2 2)
                        (3 3)
                        (4 2)
                        (5 5)
                        (6 2)
                        (7 7)
                        (9 3)
                        (15 3))) ])
  (let ([ n        (first pair)  ]
        [ smallest (second pair) ])
    (check-equal? (smallest-divisor n) smallest)))
