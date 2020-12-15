#lang sicp

;; Exercise 1.36

;; 1) Modify fixed-point so that it prints the sequence of approximations it generates,
;;    using the newline and display primitives shown in ex 1.22

(define tolerance 0.00000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ([ next (f guess) ])
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

;; 2) Find a solution to x^x = 1000 by finding a fixed point of:
;;    x -> log(1000) / log(x)
;;    compare the number of steps w/ and w/o average damping

;; Without average damping
(define (x-to-x-v1 n)
  (exact->inexact (fixed-point (lambda (x) (/ (log n) (log x))) 2)))

(display "Without average damping")
(newline)
(x-to-x-v1 1000)

;; With average damping
(define (average a b)
  (/ (+ a b) 2))
(define (x-to-x-v2 n)
  (exact->inexact (fixed-point (lambda (x) (average x (/ (log n) (log x)))) 2)))

(display "With average damping")
(newline)
(x-to-x-v2 1000)