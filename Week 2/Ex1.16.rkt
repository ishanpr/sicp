#lang scheme

(define (fast-expt b n)
    (define (expt-iter b n a)
        (cond ((= n 0) a)
              ((even? n)(expt-iter (* b b)(/ n 2) a))
              (else (expt-iter b (- n 1) (* a b)))))
    (expt-iter b n 1))
