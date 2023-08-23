#lang scheme
(define (filtered-accumulate include? combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((include? a)  (combiner (term a)
                                 (filtered-accumulate include? combiner null-value term (next a) next b)))
  (else (filtered-accumulate include? combiner null-value term (next a) next b))))



;Part a/b prerequisites
(define (square x) (* x x))
(define (prime? n)
(= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
(cond ((> (square test-divisor) n) n)
((divides? test-divisor n) test-divisor)
(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (inc x) (+ x 1))

; Part a 
(define (prime-square-sum a b)
  (filtered-accumulate prime? + 0 square a inc b))


;Part b prerequisites
(define (gcd a b)
  (if (= b 0)
  a
(gcd b (remainder a b))))

; Part b
(define (product-of-relative-primes n)
  (define (relative-prime? x) (= (gcd x n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))


