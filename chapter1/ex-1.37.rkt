#lang racket

;; Exercise 1.37

;; Recursive
(define (cont-frac-r n d k)
  (let loop ([ i 1 ])
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (loop (+ i 1)))))))

;; Iterative
(define (cont-frac-i n d k)
  (let loop ([ i (- k 1) ][ accum (/ (n k) (d k)) ])
    (if (= i 0)
        accum
        (loop (- i 1)
              (/ (n i)
                 (+ (d i)
                    accum))))))

;; Test

(define inv-phi (/ 2.0
                   (+ 1.0
                      (sqrt 5.0))))

(define delta 0.0001)

(define (test fun delta)
  (let loop ([ k 1 ])
    (let ([ result (fun (λ (i) 1.0)
                        (λ (i) 1.0)
                        k) ])
      (if (< (abs (- inv-phi result)) delta)
          (printf "Result = ~a, k = ~a\n" result k)
          (loop (add1 k))))))

(test cont-frac-r delta) ;; => Result = 0.6179775280898876, k = 10

(test cont-frac-i delta) ;; => Result = 0.6179775280898876, k = 10
