#lang sicp

(#%require racket/base)

;; Exercise 1.28

(define (fast-expt b n)
  (let loop ([b b] [n n] [a 1])
    (cond [ (= n 0)   a                              ]
          [ (even? n) (loop (* b b) (/ n 2) a)       ]
          [ else      (loop b       (- n 1) (* a b)) ])))

(define (square n) (* n n))

(define (nontrivial-root-1? m n squared)
  (and (not (= n 1))
       (not (= n (- m 1)))
       (= (modulo squared m) 1)))

(define (expmod base exp m)
  (cond [ (= exp 0)   1                                              ]
        [ (even? exp)
          (let* ([ result (expmod base (/ exp 2) m) ]
                 [ squared (square result) ])
            (if (nontrivial-root-1? m result squared)
                0
                (remainder squared m))) ]
        [ else        (remainder (* base (expmod base (- exp 1) m)) m) ]))

(define (fermat-test n)
  (let loop ([a 1])
    (if (< a n)
        (if (= (expmod a n n) a)
            (loop (+ a 1))
            #f)
        #t)))

(ormap fermat-test '(21 45 561 1105 1729 2465 2821 6601))

(andmap fermat-test '(2 3 5 7 11 13 17))