#lang sicp

(#%require racket)
(#%require rackunit)

;; Exercise 1.19
;; Call the transformation: a <- a + b and b <- a T
;; Recognize T as a special case of p = 0 and q = 1 in the family of:
;; a <- bq + aq + ap and b <- bp + aq
;; Show applying T{pq} twice is the same as T{p'q'} once where 
;; p' and q' are defined in terms of p and q
;;
;; I had to cheat a little by looking online, but as soon as I saw the
;; person used the b equation to solve for p' and q', I looked away
;; and solved for p' and q' using the b equation, and it was *much*
;; easier to then also verify it worked for the a equation after
;; having the values from the be equation.

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond [(= count 0) b]
        [(even? count) (fib-iter a
                                 b
                                 (+ (* p p) (* q q))
                                 (+ (* 2 p q) (* q q))
                                 (/ count 2))]
        [else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1))]))
       
;; Tests
(for ([pair (in-list '((0 0)
                       (1 1)
                       (2 1)
                       (3 2)
                       (4 3)
                       (5 5)
                       (6 8)))])
  (let ([n (first pair)]
        [f (second pair)])
    (check-equal? (fib n) f)))
