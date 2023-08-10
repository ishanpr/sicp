#lang scheme
; Product <-- Counter * Product
; Counter <-- Counter + 1

(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
            (+ counter 1)
            max-count)))

;(define (factorial n)
;(define (iter product counter)
;(if (> counter n)
;product
;(iter (* counter product)
;(+ counter 1))))
;(iter 1 1))

(factorial 6)

;How does the interpreter know if and when to use n in the places they were used prior.
;It doesn't need to know. The process takes place like the following while keeping the value of n in memory.

;(factorial 6)
;(fact-iter 1 1)
;(fact-iter 1 2)
;(fact-iter 2 3)
;(fact-iter 6 4)
;(fact-iter 24 5)
;(fact-iter 120 6)
;(fact-iter 720 7)
;720

;However this lexical scoping doesn't work when a procedure has functions with different number of arguments.
;Case in point, trying to implement this structure for the coin-change procedure doesn't seem to work..