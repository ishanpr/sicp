#lang scheme

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "next: ")
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (display "first-guess: ")
  (display first-guess)
  (newline)
  (try first-guess))


; Fixed point without average damping
(fixed-point (lambda (x) (/ (log 1000)(log x))) 10)

; Fixed point with average damping
(define (average x y)(/ (+ x y) 2))
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10)

; Log 10 here as log 1 is 0, log 1.1 was used in jots jottings.


; Outputs
first-guess: 10
next: 2.9999999999999996
next: 6.2877098228681545
next: 3.7570797902002955
next: 5.218748919675316
next: 4.1807977460633134
next: 4.828902657081293
next: 4.386936895811029
next: 4.671722808746095
next: 4.481109436117821
next: 4.605567315585735
next: 4.522955348093164
next: 4.577201597629606
next: 4.541325786357399
next: 4.564940905198754
next: 4.549347961475409
next: 4.5596228442307565
next: 4.552843114094703
next: 4.55731263660315
next: 4.554364381825887
next: 4.556308401465587
next: 4.555026226620339
next: 4.55587174038325
next: 4.555314115211184
next: 4.555681847896976
next: 4.555439330395129
next: 4.555599264136406
next: 4.555493789937456
next: 4.555563347820309
next: 4.555517475527901
next: 4.555547727376273
next: 4.555527776815261
next: 4.555540933824255
next: 4.555532257016376
4.555532257016376

first-guess: 10
next: 6.5
next: 5.095215099176933
next: 4.668760681281611
next: 4.57585730576714
next: 4.559030116711325
next: 4.55613168520593
next: 4.555637206157649
next: 4.55555298754564
next: 4.555538647701617
next: 4.555536206185039
4.555536206185039

; Here you can see that average damping i.e. averaging the preceding guess, x, with the current guess, log(1000)/log(x), yields an output that converges quicker with fewer steps.




; My initial version used runtime, but apparently thats not one of the primitives thats requested here.
;(define runtime current-inexact-milliseconds)

;(define (fixed-point f first-guess)
;  (define (close-enough? v1 v2)
;    (< (abs (- v1 v2))
;       tolerance)) 
;  (define (try guess start-time)
;    (let ((next (f guess)))
;      (if (close-enough? guess next)
;          (begin
;          (report (- (runtime) start-time))
;          next)
;          (try next start-time))))
;  (try first-guess (runtime)))
;
;(define (report elapsed-time)
;  (display elapsed-time)
;  (display " *** "))
