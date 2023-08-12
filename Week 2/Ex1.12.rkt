#lang scheme

;This implementation is correct but I think I copied it from somewhere...
 ;(define (pascal r c) 
 ;  (cond ((= c 1)1)
 ;        ((= c r)1)
 ;        ((> c r)0) 
 ;      ((+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))))

(define (pascal r c)
  (cond ((or (< r 1) (< c 1) (> c r))0)
        ((or (= c 1) (= c r))1)
        (else (+ (pascal (- r 1) (- c 1))
           (pascal (- r 1) c)))))

; In the second implementation, the use of the or expression within the cond structure contributed to the need for an explicit else condition.
; The or expression introduces non-mutually-exclusive conditions, which means that more than one condition can evaluate to true for the same input, making it necessary to provide a final fallback case using else.
; In the first implementation, each condition handles a specific case that doesn't overlap with the other conditions, therefore there is no need for an explicit else condition to catch other cases.
  
