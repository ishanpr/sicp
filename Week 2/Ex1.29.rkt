#lang scheme
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))
(define (cube x) (* x x x))

(define (simpsons f a b n)
(define h (/ (- b a) n))
  (define (y k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))
  (define (term k) (* (y k) (f (+ a (* k h)))))
  (define (next k) (+ k 1))
    (* (sum term a next n)
       (/ h 3)))

(simpsons cube 0 1 100)
(simpsons cube 0 1 1000)