#lang scheme

(define (halve n) (/ n 2))
(define (double x) (+ x x))
(define (even? n)
(= (remainder n 2) 0))

(define (itermult x y)
  (define (iter-mult x y a)
    (cond ((= y 0)a)
          ((even? y) (iter-mult (double x) (halve y) a))
          (else (iter-mult x (- y 1) (+ a x)))))
  (iter-mult x y 0))

; Here you don't need to accumulate a in the even condition because once y reaches 1, the else clause is carried out and a is substituted there.