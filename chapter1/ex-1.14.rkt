;; Exercise 1.14

;; Space seems to grow linearly i.e. depth of tree is linear w/ n
;; For order of growth of operations, I cheated and looked online (I have little patience for Big-O problems!)
;; The answer proposed was O(n^5) and the timings I made agree.

;; Timing various invocations gives the following. The first timing is
;; actual CPU ms, the second is n^5 multiplied by a suitable constant
;; to get the case of n=1000 to match.

;;  200 =>     11 ms :      5 ms
;;  300 =>     61 ms :     42 ms
;;  400 =>    232 ms :    176 ms
;;  500 =>    619 ms :    537 ms
;;  600 =>  1,634 ms :  1,335 ms
;;  700 =>  3,085 ms :  2,886 ms
;;  800 =>  5,922 ms :  5,627 ms
;;  900 => 10,295 ms : 10,140 ms
;; 1000 => 17,173 ms : 17,173 ms

(count-change 11)
 (cc 11 5)
  (cc 11 4)
   (cc 11 3)
    (cc 11 2)
     (cc 11 1)
      (cc 11 0)
       0
      (cc 10 1)
       (cc 10 0)
        0
       (cc 9 1)
        (cc 9 0)
         0
        (cc 8 1)
         (cc 8 0)
          0
         (cc 7 1)
          (cc 7 0)
           0
          (cc 6 1)
           (cc 6 0)
            0
           (cc 5 1)
            (cc 5 0)
             0
            (cc 4 1)
             (cc 4 0)
              0
             (cc 3 1)
              (cc 3 0)
               0
              (cc 2 1)
               (cc 2 0)
                0
               (cc 1 1)
                (cc 1 0)
                 0
                (cc 0 1)
                 1
     (cc 6 2)
      (cc 6 1)
       (cc 6 0)
        0
       (cc 5 1)
        (cc 5 0)
         0
        (cc 4 1)
         (cc 4 0)
          0
         (cc 3 1)
          (cc 3 0)
           0
          (cc 2 1)
           (cc 2 0)
            0
           (cc 1 1)
            (cc 1 0)
             0
            (cc 0 1)
             1
      (cc 1 2)
       (cc 1 1)
        (cc 1 0)
         0
        (cc 0 1)
         1
       (cc -4 2)
        0
    (cc 1 3)
     (cc 1 2)
       (cc 1 1)
        (cc 1 0)
         0
        (cc 0 1)
         1
       (cc -4 2)
        0
     (cc -9 3)
      0
   (cc -14 4)
    0
  (cc -39 5)
   0
