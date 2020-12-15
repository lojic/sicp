#lang sicp

;; Exercise 1.25

;; Appears to compute the same result, but it's much slower due to the fact that expmod makes use of
;; the fact explained in footnote 46 on p. 52:
;; Where the exponent e is greater than 1, then for any integers x, y & m, we can find the remainder
;; of (x * y) modulo m by computing x mod m & y mod m, multiply the results and take the remainder
;; mod m.

(define (fast-expt b n)
  (let loop ([b b] [n n] [a 1])
    (cond [ (= n 0)   a                              ]
          [ (even? n) (loop (* b b) (/ n 2) a)       ]
          [ else      (loop b       (- n 1) (* a b)) ])))

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (expmod base exp m)
  (cond [ (= exp 0)   1                                              ]
        [ (even? exp) (remainder (square (expmod base (/ exp 2) m)) m) ]
        [ else        (remainder (* base (expmod base (- exp 1) m)) m) ]))

(define (square n) (* n n))

