#lang scheme
(define (filtered-accumulate include? combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((include? a)  (combiner (term a)
                                 (filtered-accumulate include? combiner null-value term (next a) next b)))))
