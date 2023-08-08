#lang scheme

;The original tolerance level of 0.001 is too strict on larger numbers
;and too lenient on small numbers.
;Using a method that takes into consideration the reative error is a superior approach.

;With the original one (sqrt 1e128) would not compute due to the above.
;One thing is that 0 computes to an incorrect value...

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.0000001))

;Fractional good-enough?
(define (good-enough? guess x)
  (< (/ (abs (- (square guess) x)) guess)
  (* guess 0.0001)))


(define (square x)(* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(display (sqrt 0)) (newline)
(display (sqrt 2)) (newline)
(display (sqrt 3)) (newline)
 (display (sqrt 1e-308)) (newline) 
 (display (sqrt 1e-256)) (newline) 
 (display (sqrt 1e-128)) (newline) 
 (display (sqrt 1e-64)) (newline) 
 (display (sqrt 1e-32)) (newline) 
 (display (sqrt 1e-16)) (newline) 
 (display (sqrt 1e-8)) (newline) 
 (display (sqrt 1e-4)) (newline) 
 (display (sqrt 1e-2)) (newline) 
 (display (sqrt 1e-1)) (newline) 
 (display (sqrt 1)) (newline) 
 (display (sqrt 1e1)) (newline) 
 (display (sqrt 1e2)) (newline) 
 (display (sqrt 1e4)) (newline) 
 (display (sqrt 1e8)) (newline) 
 (display (sqrt 1e16)) (newline) 
 (display (sqrt 1e32)) (newline) 
 (display (sqrt 1e64)) (newline) 
 (display (sqrt 1e128)) (newline) 
 (display (sqrt 1e256)) (newline) 
 (display (sqrt 1e307)) (newline) 