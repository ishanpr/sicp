#lang scheme

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "next: ")
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (display "first-guess: ")
  (display first-guess)
  (newline)
  (try first-guess))

; Fixed point without average damping
(fixed-point (lambda (x) (/ (log 1000)(log x))) 10)

; Fixed point with average damping
(define (average x y)(/ (+ x y) 2))
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10)



; My initial version used runtime, but apparently thats not one of the primitives thats requested here.
;(define runtime current-inexact-milliseconds)

;(define (fixed-point f first-guess)
;  (define (close-enough? v1 v2)
;    (< (abs (- v1 v2))
;       tolerance)) 
;  (define (try guess start-time)
;    (let ((next (f guess)))
;      (if (close-enough? guess next)
;          (begin
;          (report (- (runtime) start-time))
;          next)
;          (try next start-time))))
;  (try first-guess (runtime)))
;
;(define (report elapsed-time)
;  (display elapsed-time)
;  (display " *** "))