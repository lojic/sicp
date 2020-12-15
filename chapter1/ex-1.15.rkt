#lang sicp

(#%require racket/base)

;; a. How many times is the procedure p applied when (sine 12.15) is evaluated?
;;    Answer: 5 times 

;; b. What is the order of growth in space and number of steps (as a function of a) used by the
;;    process generated by the sine procedure when (sine a) is evaluated?
;;    Answer: 2 log10(a) + 4, so O(log a) for both space/steps

(define count-invocations
  (let ([count 0])
    (λ ()
      (set! count (+ count 1))
      (printf "Count is ~a\n" count))))

(define (cube x) (* x x x))

(define (p x)
  (- (* 3 x)
     (* 4 (cube x))))

(define (sine angle)
  (count-invocations)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 10000)
