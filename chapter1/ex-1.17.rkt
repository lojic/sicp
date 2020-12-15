#lang sicp

(#%require racket)
(#%require rackunit)

;; Exercise 1.17
;; Use (double) and (halve) to design a multiplication procedure
;; analogous to fast-expt that uses a logarithmic number of steps.

;; NOTE: it appears I implemented the solution for exercise 1.18 here
;; accidentally

(define (double i)
  (+ i i))

(define (halve i)
  (/ i 2))

(define (fast-mult a b)
  (let loop ([a a] [b b] [acc 0])
    (cond [ (= b 0)   0                                           ]
          [ (= b 1)   (+ a acc)                                   ]
          [ (even? b) (loop (double a) (halve b) acc)             ]
          [ else      (loop (double a) (halve (- b 1)) (+ a acc)) ])))

;; Tests
(for ([triple (in-list '((0 0 0)
                         (0 1 0)
                         (1 0 0)
                         (1 2 2)
                         (2 1 2)
                         (7 5 35)
                         (5 7 35)
                         (8 6 48)
                         (6 8 48)
                         (10 7 70)
                         (7 10 70)))])
     (match-define (list a b p) triple)
     (check-equal? (fast-mult a b) p))
