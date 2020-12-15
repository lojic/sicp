#lang sicp

;; Exercise 1.31
;; Create a product function analogously to sum

;; Linear recursive version
(define (product-r term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-r term (next a) next b))))

;; Iterative version
(define (product-i term a next b)
  (let loop ([a a] [result 1])
    (if (> a b)
        result
        (loop (next a) (* (term a)
                          result)))))

(define product product-i)

(define (fac n)
  (product identity 1 inc n))

(define (pi n)
  (define max (* n 2))
  (define (add2 n) (+ n 2))

  (let ([ denominator (product identity 3 add2 (+ 3 max)) ]
        [ numerator1  (product identity 2 add2 (+ 2 max)) ]
        [ numerator2  (product identity 4 add2 (+ 4 max)) ])
    (* 4
       (/ numerator1 denominator)
       (/ numerator2 denominator))))

;(exact->inexact (pi 20000))

;; From billthelizard.com
;(define (pi n)
;  (define (term i)
;    (let ([4i2 (* 4 i i)])
;      (/ 4i2
;         (- 4i2 1))))
;  (* 2 (product term 1 inc n)))

;(exact->inexact (pi 10000))

;; Tests

(#%require rackunit)

(check-equal? (product identity 1 inc 5) 120)
(check-equal? (fac 10) 3628800)
(check-within (pi 10000) 3.141593 0.0001)
