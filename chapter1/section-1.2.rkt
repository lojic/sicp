#lang sicp

;; 1.2.1

(define (factorial1 n)
  (if (= n 1)
      1
      (* n (factorial1 (- n 1)))))

;(factorial1 6)

(define (factorial2 n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))

  (iter 1 1))

;(factorial2 6)

;; Simplify the above w/ named let
(define (factorial3 n)
  (let loop ([product 1] [counter 1])
    (if (> counter n)
        product
        (loop (* counter product)
              (+ counter 1)))))

;(factorial3 6)

;; 1.2.2

(define (count-change amount)
  (define (cc amount kinds-of-coins)
    (cond [ (= amount 0) 1 ]
          [ (or (< amount 0)
                (= kinds-of-coins 0)) 0 ]
          [ else (+ (cc amount (- kinds-of-coins 1))
                    (cc (- amount
                           (first-denomination kinds-of-coins))
                        kinds-of-coins)) ]))

  (define (first-denomination kinds-of-coins)
    (cond [ (= kinds-of-coins 1)  1 ]
          [ (= kinds-of-coins 2)  5 ]
          [ (= kinds-of-coins 3) 10 ]
          [ (= kinds-of-coins 4) 25 ]
          [ (= kinds-of-coins 5) 50 ]))

  (cc amount 5))

;(count-change 100)