#lang scheme
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


(define (fermat-test-all n)
  (define (try-it a)
    (cond ((= a n) #t)
          ((= (expmod a n n) a) (try-it (+ a 1)))
          (else #f)))
  (try-it 1))
; This procedure modifies the initial fermat-test procedure to remove the randomness and replace it with iterative tesing of all values in the range 1<= a <n
; This checks to see if fermat's test holds true for the current value of a. If it is, the second condition is passed where a is iterated recursively.
; If all values satisfy the congruence, it calls try-it recursively with the next value a+1.
; This procedure starts from a=1 and goes through all values until a=n, which is the distinction from the previously defined fermat-test procedure.


(define (prime? n)
(= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (next n)
  (if (even? n) (+ n 1) (+ n 2)))

; Here we could define another procedure called charmichael? to check if a given value is a Charmichael number
(define (charmichael? n)
  (and (fermat-test-all n) (not (prime? n))))
; Here #t is outputted only if n is both not a prime and tests positive for fermat-test-all.
; This reduces the likelihood of false positives and negatives.

(fermat-test-all 7)
(prime? 9)
(newline)
(charmichael? 67)
(charmichael? 561)
(charmichael? 1729)
(charmichael? 2465)
(charmichael? 2821)
(charmichael? 6601)