#lang scheme
; This is from the Fermat test section of 1.2.6
; The following is a procedure that calculates the exponential of a number modulo another number.
; The Fermat test is a predictive way to find the if a given number is prime.
; Fermat's little theorem states that if `n` is a prime number, and `a` is any positive integer less than n, then `a^n` results in a value that is congruent to `a modulo n`
; Basically when a is divided by n, both a^n and a will have the same remainder.

; 1. Congruent modulo n - Two numbers 'x' and 'y' are congruent modulo 'n' if their difference 'x - y' is divisible by 'n'. In notation, this is expressed as: x ≡ y (mod n)
; Eg- Conside n = 7. Numbers 11 and 18 are congruent modulo 7, as their difference (18-11=7) is divisible by 7. That is 18 ≡ 11 (mod 7)

; 2. Fermat's little theorem - For a prime 'n' and a positive integer 'a' less than 'n', Fermat's Little Theorem states: a^n ≡ a (mod n)
; Eg- Take 'n = 5' and 'a = 3'. According to Fermat's Little Theorem: 3^5 ≡ 3 (mod 5). Calculating: 243 ≡ 3 (mod 5). i.e. (243-3) is divisible by 5.

; 3. Testing primality using Fermat's test - The process is to randomly select a number `a` less than `n`, calculate a^n modulo n, and checking if the result is congruent to a. If it is, there is a higher chance that n is prime.
; Eg- Testing primality for n = 7: Pick a random number a less than 7, let's say a= 3. Calculate a^n modulo n, check if the result is congruent to a. Since this condition holds true here, we have some confidence that 7 might be a prime.

; 4 - Iterative testing - To increase confidence in primality, Fermat's Test can be repeated with various random values of 'a'. If the congruence condition holds for multiple 'a' values, the likelihood of 'n' being prime increases.
; Eg- Continuing with n = 7, pick another random a, let's say a = 5, calculate a^n modulo n, check if the result is congruent to a. Since this condition doesn't hold this time we become less confiden about primality.

; The Fermat's test is to try more and more values of a so that we can gradually increase or decrease the confidence in the primality of n. Keep in mind this is a probabilistic method to find primality.

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
; The exp function calculates e^n where e is the constant 2.71 . Eg (exp 2) displays the value of e^2
(define (square x) (* x x))
(expmod 3 4 7)