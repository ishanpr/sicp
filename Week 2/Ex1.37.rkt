#lang scheme
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

; This starts from the bottom and keeps accumulating up.
; Keep in mind that n and d here are procedures not variables.
; With (n i) and (d i) the values of i is substituted into the n and d procedures.

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12)

; Recursive version
(define (cont-frac n d k)
  (define (recur i)
    (if (= i 0)
        0
        (/ (n i) (+ (d i) (recur (- i 1))))))
  (recur k))
