#lang sicp

;; 1.1.4
(define (square x) (* x x))
;(square 7)

(define (sum-of-squares x y)
  (+ (square x) (square y)))
;(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
;(f 5)

;; 1.1.6
(define (abs x)
  (cond [ (> x 0) x     ]
        [ (= x 0) 0     ]
        [ (< x 0) (- x) ]))

(define (abs2 x)
  (cond [ (< x 0) (- x) ]
        [ else    x     ]))

(define (abs3 x)
  (if (< x 0)
      (- x)
      x))
;(abs 3)
;(abs 0)
;(abs -2)

;; 1.1.7
(define (sqrt-iter guess x)
  (define (average x y)
    (/ (+ x y) 2))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (good-enough? guess x)
    (< (abs (- (square guess)
               x))
       0.000001))

  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;(sqrt 2)

;; 1.1.8

(define (square2 x)
  (exp (double (log x))))

(define (double x) (+ x x))
; (square 7)

