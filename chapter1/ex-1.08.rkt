#lang sicp

;; Exercise 1.8

(define (cubert-iter prev-guess guess x)
  (define (square x) (* x x))
  
  (define (improve guess x)
    (/ (+ (/ x
             (square guess))
          (* 2 guess))
       3))

  ; Modify good-enough to examine the percent change between guesses
  (define (good-enough? prev-guess guess)
    (< (/ (abs (- prev-guess guess))
          guess)
       0.001))
  
  (if (good-enough? prev-guess guess)
      guess
      (cubert-iter guess
                   (improve guess x)
                   x)))

(define (cubert x)
  (cubert-iter 0.0 1.0 x))

(cubert 30)

