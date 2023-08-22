#lang scheme
(define (cube x) (* x x x))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 3 4)


; Procedure to find the integral
(define (integral f a b dx)
(define (add-dx x)
(+ x dx))
(* (sum f (+ a (/ dx 2.0)) add-dx b)
dx))
;When implementing the integral calculation using the sum procedure, you want to start from the initial value a, add dx at each step, and continue until you reach b. 
;This is why, in the expression (* (sum f (+ a (/ dx 2.0)) add-dx b) dx), a comes first, then you add (dx / 2.0) to it to ensure that you start from the midpoint of the first interval, and b is the last argument. 
;The step size dx is used to increment the value from a to b.
