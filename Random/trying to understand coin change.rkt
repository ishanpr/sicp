#lang scheme
;Trying to understand the coin counting program

(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
(cond ((= amount 0) 1)
((or (< amount 0) (= kinds-of-coins 0)) 0)
(else (+ (cc amount
(- kinds-of-coins 1))
(cc (- amount
(first-denomination
kinds-of-coins))
kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
(cond ((= kinds-of-coins 1) 1)
((= kinds-of-coins 2) 5)
((= kinds-of-coins 3) 10)
((= kinds-of-coins 4) 25)
((= kinds-of-coins 5) 50)))

;Here what essentially happens is that the amount of the largest coin denomination is subtracted from the original amount
;This amount continues to be subtracted by the coin denominations in descending order until the amout becomes 1
;Then this 1 is carried to the top of the tree here and the sum of the 1s in the nodes of the tree is the final answer.
;The structure of this tree can be seen in exercise 1.14 in Week 2 for 11 cents.
