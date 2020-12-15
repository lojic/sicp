#lang sicp

(#%require math/number-theory)

;; Exercise 1.33
;; Add a filter predicate to accumulate

(define (filtered-accumulate combiner filter null-value term a next b)
  (let loop ([a a] [result null-value])
    (if (> a b)
        result
        (let ([ arg (term a) ])
          (if (filter arg)
              (loop (next a) (combiner arg result))
              (loop (next a) result))))))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate (lambda (arg result)
                         (+ (* arg arg)
                            result))
                       prime?
                       0
                       identity
                       a
                       inc
                       b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relatively-prime? i n)
  (= (gcd i n) 1))

(define (product-relatively-prime a b)
  (filtered-accumulate *
                       (lambda (n) (relatively-prime? n b))
                       1
                       identity
                       a
                       inc
                       b))

;; Tests

(#%require rackunit)

(check-equal? (sum-of-squares-of-primes 1 10) 87)

(check-equal? (product-relatively-prime 1 10) 189)
              