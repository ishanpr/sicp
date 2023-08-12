#lang scheme

(define (fast-expt b n)
    (define (expt-iter b n a)
        (cond ((= n 0) a)
              ((even? n)(expt-iter (* b b)(/ n 2) a))
              (else (expt-iter b (- n 1) (* a b)))))
    (expt-iter b n 1))

; Here when n is an even number it gets divided by 2 until it becomes 1. Once it's 1, since 1 is an odd number, the else clause is executed.

; Defining and using (square b) instead of (* b b) is a better practice. (Better clarity, modularity, etc, but it doesn't matter here.
