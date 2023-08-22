#lang scheme
;(define (accumulate combiner null-value term a next b)
;  (if (> a b)
;      null-value
;      (combiner (term a)
;                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (inc x) (+ x 1))
(sum (lambda (x) (* x 2)) 1 inc 10)
(sum identity 1 inc 10)
(product identity 1 inc 10)

; This is an iterative implementation of the accumulate procedure.
(define (accumulate combiner null-value term a next b)
  (define (iter a null-value)
  (if (> a b)
      null-value
      (iter (next a) (combiner null-value (term a)))))
  (iter a null-value))
      
     