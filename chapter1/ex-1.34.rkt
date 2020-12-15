#lang sicp

;; Exercise 1.34

(define (square n) (* n n))

(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

;; What happens if we (perversely) ask the interpreter to evaluate
;; the combination (f f)? Explain.

; (f f)
; (f 2)
; (2 2) => error, 2 is not a procedure

(f f)