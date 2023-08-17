#lang scheme


; The nontrivial square root of a number `a` is a value `x` such that the square of `x` is equal to `a` and `x` is not equal to the positive or negative square root of `a`.
; For example consider a real number, a = 9. Then the square roots of `a` are 3 and -3, both of them which are trivial square roots because their squares are equal to `a`. (3^2 = 9 and (-3)^2 = 9) 
; A nontrivial square root in this case is would be a value that is neither 3 nor -3 and satisfies the equation x^2 = 9.
; However in the real number system, there are no nontrivial square roots of 9.
; But numbers with no perfect squares, such as 2, 3, 5, 6, 7, 10, etc., have nontrivial square roots. For example square root of 2 is a non trivial square root because the result is an imaginary number.

; In modular arithmetic, some numbers have nontrivial square roots modulo a given modulus.
; For instance, consider modulo 7. The number 3 has nontrivial square roots modulo 7, which are 2 and 5, because both 2^2 ≡ 3 (mod 7) and 5^2 ≡ 3 (mod 7).
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))
(define (square x) (* x x))

;My unsuccessful attempt
;(define (miller-rabin-test n)
;  (define (iter a)
;    (+ 1 (random (< a n))))
;  (expmod a n n)
;  (iter 1))

(define (non-trivial-sqrt? x n)
  (and (not (= x 1)) (not (= x (- n 1)))
       (= (remainder (square x) n) 1)))
; Here if x = 1 or x = n - the not is taken as both of indicate its a trivial square root. We're interested in nontrivial ones, hence the not.
; There are three conditions in the `and` here. The thrid condition, (= (remainder(... checks if the remainder of (square x) divided by n is equal to 1. This is what makes x a candidate for a nontrivial square root modulo n.
; The and operator ensures all 3 conditions are true in order for the procedure to return true, indicating that `x` is a non trivial square root of module n. If any condition evaluates to false, the whole expression is false.

; If a nontrivial square root exists we can say that the value is not a prime.

(define (zero-if-non-trivial-sqrt x n)
  (if (non-trivial-sqrt? x n) 0 x))
; This procedure takes two arguments and evaluates if the non-trivial-sqrt? function for the provided values output true or false, and returns 0 or x accordingly.

(define (mrt-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder
                       (square
                         (zero-if-non-trivial-sqrt
                           (mrt-expmod base (/ exp 2) m) m)) m))
        (else (remainder (* base (mrt-expmod base (- exp 1) m)) m))))
; This is similar to regular expmod but is modified to handle nontrivial square roots.
; The output is 1 if the base case (= exp 0) true.
; The even exponent procedure performs modular exponentiation with Miller Rabin test if the exp is even.
; The (mrt-expmod... procedure recursively calculates modular exponentiation of of `base` raised to half of `exp` modulo `m`
; The (zero-if... procedure calls the procedure to handle nontrivial square roots and potentially zero out values.
; After that square and remainder...m is invoked.
; Else handles the case when the `exp` is odd.

(define (miller-rabin-test n)
  (define (try-it a)
    (= (mrt-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))