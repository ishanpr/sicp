#lang scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; The point of using successive squaring is to reduce the number of calculations required.
; With the implementation using square, (expmod base (/ exp 2) m) is only calulated once, and then squared.
; With this (Θ(n)) approach (expmod base (- exp 1) m) is calculated in each recursive call regardless of it being even or not.

; expmod is Θ(log(n)) as it uses log(n) number of iterations to get a^n. By doubling the amount of steps in each squaring, we end up doing 2^log(n) = Θ(n) - sicp
; Louis' implementation here is to calculate (expmod base (/ exp 2) m) twice and multiplying them together.

; Significantly better explanation on jots-jottings blog.
