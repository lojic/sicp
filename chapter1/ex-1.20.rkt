#lang sicp

;; Exercise 1.20

;; Using the substitution method (for normal order), illustrate the process generated in
;; evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How
;; many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)?
;; In the applicative-order evaluation?

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal order

; (if (= 40 0)
;   206
;   (gcd 40 (remainder 206 40)))

; (gcd 40 (remainder 206 40))

; (if (= (remainder 206 40) 0)
;   40
;   (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))

; (if (= 6 0)  ; 1 remainder evaluated
;   40
;   (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))

; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

; (if (= (remainder 40 (remainder 206 40)) 0)
;   (remainder 206 40)
;   (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

; Got bored at this point, but clearly there are more evaluations in the normal order :)

; Applicative order
; (gcd 206 40)
; (gcd 40 6)
; (gcd 6 4)
; (gcd 4 2)
; (gcd 2 0)
; 2

; 4 remainder operations in applicative order