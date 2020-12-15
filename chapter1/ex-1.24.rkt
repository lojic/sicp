#lang sicp

(#%require racket)

;; Allows random numbers greater than the 4,294,967,087 limit
;; of the built-in random function by using random-natural.
(#%require math/base)

;; Exercise 1.24

(define (expmod base exp m)
  (cond [ (= exp 0)   1                                              ]
        [ (even? exp) (remainder (square (expmod base (/ exp 2) m)) m) ]
        [ else        (remainder (* base (expmod base (- exp 1) m)) m) ]))

(define (fast-prime? n times)
  (cond [ (= times 0)     #t                          ]
        [ (fermat-test n) (fast-prime? n (- times 1)) ]
        [ else            #f                          ]))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))

  (try-it (+ 1 (random-natural (- n 1)))))

(define (prime? n)
  (fast-prime? n 100))

(define (square n) (* n n))

(define (three-smallest-primes start-n)
  (let loop ([count 0] [n (+ start-n
                             (if (even? start-n)
                                 1
                                 0))])
    (if (>= count 3)
        (void)
        (let ([seconds (timed-prime-test n)])
          (cond [ seconds (printf "~a seconds to find ~a is prime\n" seconds n)
                          (loop (+ count 1) (+ n 2)) ]
                [ else    (loop count (+ n 2)) ])))))

(define (timed-prime-test n)
  (let ([ t1 (runtime) ])
    (if (prime? n)
        (exact->inexact (/ (- (runtime) t1)
                           1000000))
        #f)))
