#lang sicp

;; Exercise 1.11

(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2
            (f1 (- n 2)))
         (* 3
            (f1 (- n 3))))))

;(f1 -1)
;(f1 0)
;(f1 1)
;(f1 3)
;(f1 4)
;(f1 10)
;(f1 30)

(define (f2 n)
  (if (< n 3)
      n
      (let loop ([i 3] [fn-1 2] [fn-2 1] [fn-3 0])
        (let ([result (+ fn-1
                         (* 2 fn-2)
                         (* 3 fn-3))])
          (if (= i n)
              result
              (loop (+ i 1) result fn-1 fn-2))))))

;(f2 -1)
;(f2 0)
;(f2 1)
;(f2 3)
;(f2 4)
;(f2 10)
;(f2 30)
