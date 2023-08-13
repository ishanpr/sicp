#lang scheme
;This is a test to determine the primality of a number n. Section 1.2.6

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(prime? 9)
; Here as the first step the else branch of find-divisior is executed.
; Then the recursive call to (find-divisor 9 3) is called. Since 9 is divisible by 3 the cond is saaisfied and `test-divisor = 3` is returned.
; The result of (find-divisor 9 3) is 3. Which is the smallest divisor of 9 in the `smallest divisor` procedure, where it's 3.
; Finally the prime procedure checks if 9 is equal to its smallest divisor which is 3 here, which is not equal so the output is false.

(prime? 7)
; Here the else branch is executed once, then once test-divisor is set to 3, square 3 evaluates to 9 which is greater than 7 therfore the first condition is satisfied.
; Therefore 7 is returned and the output is #t.

(prime? 1)
; Here the expression evaluates to #t eventhough 1 is not a prime as, according to the funcion a prime is considered if (= 1 (smallest-divisor 1)) that is 1=1

(prime? 1764789546754748346753)
;The algorithm is able to calculate a value even as large as this due to the way the program works recursively to find the smallest-divisor.
