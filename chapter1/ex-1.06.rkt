#lang sicp

;; Exercise 1.6
;; Infinite recursion due to evaluating the else clause

(define (new-if predicate then-clause else-clause)
  (cond [predicate then-clause]
        [else      else-clause]))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
  (define (square x) (* x x))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (improve guess x)
    (average guess (/ x guess)))

  (define (good-enough? guess x)
    (< (abs (- (square guess)
               x))
       0.000001))
  
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt-iter 1.0 2)