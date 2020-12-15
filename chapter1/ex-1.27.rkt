#lang sicp

(#%require racket/base)

;; Exercise 1.27

(define (fast-expt b n)
  (let loop ([b b] [n n] [a 1])
    (cond [ (= n 0)   a                              ]
          [ (even? n) (loop (* b b) (/ n 2) a)       ]
          [ else      (loop b       (- n 1) (* a b)) ])))

(define (square n) (* n n))

(define (expmod base exp m)
  (cond [ (= exp 0)   1                                              ]
        [ (even? exp) (remainder (square (expmod base (/ exp 2) m)) m) ]
        [ else        (remainder (* base (expmod base (- exp 1) m)) m) ]))

(define (fermat-test n)
  (let loop ([a 1])
    (if (< a n)
        (if (= (expmod a n n) a)
            (loop (+ a 1))
            #f)
        #t)))

(time
 (andmap fermat-test '(561 1105 1729 2465 2821 6601)))