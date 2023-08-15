#lang scheme
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fermat-test n)
(define (try-it a)
(= (expmod a n n) a))
(try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
(cond ((= times 0) true)
((fermat-test n) (fast-prime? n (- times 1)))
(else false)))

;(fast-prime? 5477 453)
;(fast-prime? 15 7)

; While both procedures utilize exponentiation and squaring, fast-expt calculates pure exponentiation, and expmod calculates exponentiation modulo a given value 'm'.

; Using fast-expt here works but the issue is that the process takes too long and uses too much compute. (My computer froze running a 4 digit value lmao)

; "Once the numbers exceed a certain value (2^30 on my interpreter) the interpreter needs to use a different representation that can handle larger values.
; And when it does this, the performance of the calculations degrades. In this case we're raising numbers to powers over 1,000, 10,000, etc, and so we'll quickly reach the point where this change occurs."
; - jots-jottings
