#lang scheme
(define runtime current-inexact-milliseconds)

; Runtime doesn't work directly on DrRacket, the above command rectifies that.

(define (timed-prime-test n)
(newline)
(display n)
(start-prime-test n (runtime)))
(define (start-prime-test n start-time)
(if (prime? n)
(report-prime (- (runtime) start-time))
0))
(define (report-prime elapsed-time)
(display " *** ")
(display elapsed-time))

; The implementation provided by the book, didn't have an else clause in the if condtion, therefore I used 0 as the else.

(define (prime? n)
(= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square x) (* x x))



(define (search-for-primes lower upper)
  (define (iter n)
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2)))))
  (iter (if (odd? lower) lower (+ lower 1))))
; Here when search-for-primes function takes 2 values lower and upper and it is tested if the lower value is odd.
; If lower is odd, lower is returned, if even 1 is added to lower and this value is passed through the condition and odd values are iterated by adding 2 to it.
; Then it is iterated through the odd numbers until the upper limit is reached.
; The cond does both calling the timed-prime-test function and incrementing n by 2 using (+ n 2), and recursively calls the iter function.
; Each odd number is tested for primality.



; The following is an alternative implementation of the same function I found on jots-jottings
; The differences here are that this uses a loop like construct with iter as opposed to the recursion used in the previous implementation.
; This implementation is more efficient for larger ranges thanks to this fact that is doesn't involve recursive function calls.
;(define (search-for-primes n m)
;  (define (iter i)
;    (timed-prime-test i)
;    (if (> (+ i 2) m) (display "") (iter (+ i 2))))
;  (iter (if (odd? n) n (+ n 1))))
; Here first the iter condition is carried out to find if the value of n is odd and then if it is timed-prime-test is called.
; This value is incremented by 2 until it reaches a value higher than the upper limit m is reached and when it does a blank is displayed. (Indicated by " ")



;(prime? 7)
;(timed-prime-test 7)
(search-for-primes 14 28)


;Ignore all this, I tried to make the function from scratch without realizing its provided.
;(define (smallest-divisor n) (find-divisor n 2))
;(define (find-divisor n test-divisor)
;  (cond ((> (square test-divisor) n) n)
;        ((divides? test-divisor n) test-divisor)
;        (else (find-divisor n (+ test-divisor 1)))))
;(define (divides? a b) (= (remainder b a) 0))
;
;(define (square x) (* x x))
;
;(define (timed-prime-test n)
;  (display n)
;  (if (= n (smallest-divisor n)) (display "***") #f))
; I did all this without reading the question where the procedure is actually provided.



