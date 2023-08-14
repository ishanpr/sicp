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

; Using fast-expt here is functional but the issue here is that the process takes too long and uses too much compute. Computer froze running a 4 digit value lmao

; " once the numbers exceed a certain value (230 on my interpreter) the interpreter needs to use a different representation that can handle larger values.
; And when it does this, the performance of the calculations degrades. In this case we're raising numbers to powers over 1,000, 10,000, etc, and so we'll quickly reach the point where this change occurs."
; - jots-jottings