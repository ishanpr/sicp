#lang scheme

;Just trying to understand block structures in unit 1.
(define (square x)(* x x))
(define (average x y)
  (/ (+ x y) 2))

;You don't have to pass x explicitly here as it is defined expernally.
;(define (sqrt x)
;  (define (good-enough? guess x)
;    (< (abs (- (square guess) x)) 0.0001))
;  (define (improve guess x) ( average guess (/ x guess)))
;  (define (sqrt-iter guess x)
;    (if (good-enough? guess x)
;        guess
;        (sqrt-iter (improve guess x) x)))
;  (sqrt-iter 1.0 x))

;X isn't explicitly passed here so this is better.(Mostly)
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess) ( average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


(sqrt 9)
(display (sqrt 0)) (newline)
(display (sqrt 2)) (newline)
(display (sqrt 3)) (newline)