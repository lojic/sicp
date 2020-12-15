#lang sicp

;; Exercise 1.7

(define (sqrt-iter prev-guess guess x)
  (define (square x) (* x x))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (improve guess x)
    (average guess (/ x guess)))

  ; Modify good-enough to examine the percent change between guesses
  (define (good-enough? prev-guess guess)
    (< (/ (abs (- prev-guess guess))
          guess)
       0.001))
  
  (if (good-enough? prev-guess guess)
      guess
      (sqrt-iter guess
                 (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))

(sqrt 0.003)
(sqrt 347298723469687)

