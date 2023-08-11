#lang scheme

; Recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))(* 2 (f (- n 2)))(* 3(f (- n 3))))))


; Iterative process
(define (f n)
  (define (iter a b c count)
    (if (= count n)
        c
        (iter b c (+ c (* 2 b) (* 3 a)) (+ count 1))))
  (if (< n 3)
      n
     ;(iter 0 1 2 2)))
      (iter 1 2 4 3)))

;Here we know that when n=3 the preceding 3 values a b and c based on the initial equation are 0, 1, and 2 respectively.
;Therefore we can set that as the base case, as in (iter 0 1 2 2), count 2 as the starting point has to be less than 3.
;But since evaluating that expression evaluates to false when computing (f 3), causing the next iteration, (iter 1 2 4 3)
;We could skip this step and directly use (iter 1 2 4 3) instead.
;Here since count = 3 the value of c i.e. 4 is returned. (Which doesn't affect accuracy, it just skips a redundant step.

;The following is how the iterative implementation works.
;First (f n) is called
;If n is less than 3 the result n is returned.
;If n is greater or equal it enters the else part of the latter if statement
;The base iter is checked and if it's not equal it gets incremented until the target count is reached, by plugging the values into the equation.
;When count = n the final value of c is returned.

;P.S. iter values need to be at the end, it can't go before iter is defined.


(f 7)
(f 2)
