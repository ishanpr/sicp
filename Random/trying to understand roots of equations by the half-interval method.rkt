#lang scheme
(define (average x y) (/ (+ x y) 2))
(define (close-enough? x y) (< (abs (- x y)) 0.001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
(search f midpoint pos-point))
                (else midpoint))))))

; You need to know the half-interval method (bisection method) of finding roots to understand this. Look it up on YT.

; Search takes 3 arguments, f which is the function, neg-point which is the lower interval, pos-point which is the upper end i.e. the left and right endpoints of the interval respectively.
; [neg-point, pos-point]
; Inside the let special form, a variable is defined and intialized with the values of (average neg-point pos-point)
; The if statement checks whether we are close enough to a root. close-enough? determines if the interval neg and pos is sufficiently small to be considered as having found a root.
; If it is close enough the function returns midpoint as the output i.e. approximate root.
; If the interval is not close enough to a root, the procedure enters another let binding.
; Inside this second let, test-value is calculated by evaluating f at the midpoint. This gives the value of the function at the midpoint.
; The cond expression is used to make a decision based on the test value.
; If test value is positive it means that the root must be somewhere in the left subinterval, i.e. [neg-point, midpoint] Therefore the search function is called recursively with f but with the new endpoints.
; If test-value is negative it means that the root must be somewhere in the right subinterval [midpoint, pos-point]
; If test-value is neither positive nor negative (i.e., it's zero or some non-numeric value), it's assumed to be very close to the root, and midpoint is returned as the approximate root.
 
; 
