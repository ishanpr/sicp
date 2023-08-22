#lang scheme
(define (product term a next b)
  (if (> a b)
      1.0
      (* (term a) (product term (next a) next b))))

; 1 since we start with 1 when multiplying.

(define (inc x) (+ x 1))
(define (factorial n)
  (if (= n 0)
      1
      (product identity 1 inc n)))

(define (wallis-product n)
  (define (wallis-term n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2))))
  (product wallis-term 1 inc n))
; Here it may seem redundant as the wallis-term for n is calculated twice, but its actually not.
; Read about lexical scoping.

(* 4(wallis-product 1000))
; The original procedure calculates pi/4 while this calculates pi.

; Iterative process for product procedure
(define (product term a next b)
(define (iter a result)
(if (> a b)
    result
    (iter (next a) (* result (term a)))))
  (iter a 1))