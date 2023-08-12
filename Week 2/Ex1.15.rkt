#lang scheme
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
(if (not (> (abs angle) 0.1))
angle
(p (sine (/ angle 3.0)))))

; a. How many times is the procedure p applied when (sine 12.15) is evaluated?
     ; 5 times
; b. What is the order of growth in space and number of steps (as a function of a) used by the process generated by the sine procedure when (sine a) is evaluated?
     ; Θ(log a) order of growth for both

; Actually Θ(log3a) (log base 3 a) but, we also know that logx 1 = 0 for any x, but our terminating condition occurs when a is 0.1, not 1. To account for this we multiply a by 10 in the order of growth, giving: Θ(log3 10a).
; -From jots jottings