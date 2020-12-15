#lang sicp

(#%require racket)

;; Exercise 1.23

;; Ratio was 1.5 to 1.7 vs. the expected 2. I expect the difference is due to the extra operations
;; added by the next procedure.

(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond [ (> (square test-divisor) n) n                    ]
        [ (divides? test-divisor n)   test-divisor         ]
        [ else                        (find-divisor 
                                       n 
                                       (next test-divisor)) ]))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

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
