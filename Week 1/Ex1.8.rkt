#lang scheme
(define (cube x)(* x x x))
(define (cbrt-iter guess x)
(if (good-enough? guess x)
guess
(cbrt-iter (improve guess x) x)))
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))


(define (good-enough? guess x)

;The below might not yield consistently accurately results  
;(< (abs (- (cube guess) x)) 0.001))

;This seems to be the best option given the formula used in improve
(= (improve guess x) guess))

;This approach is supposed to reduce relative error but it computes -2 incorrectly.
;(< (/ (abs (- (cube guess) x))guess) (* guess 0.001)))


(define (cbrt x)
(cbrt-iter 1.1 x))

;Changed 1.0 to 1.1 as -2 didn't compute.

(cbrt 5)
(cbrt -2)
(cbrt 27)
(cbrt 0)