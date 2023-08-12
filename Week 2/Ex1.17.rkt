#lang scheme

(define (halve n) (/ n 2))
(define (double x) (+ x x))
(define (even? n)
(= (remainder n 2) 0))

(define (mult x y)
  (cond ((= y 0) 0)
        ((even? y) (double (mult x (halve y))))
        (else  (+ x (mult x (- y 1))))))

; This is a recursive function to calculate the product of two numbers.
; Here only including (= y 0) is sufficient as in the else cond handles this case when x = 0 