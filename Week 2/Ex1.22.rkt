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
(newline)
(search-for-primes 1000 1020)
(newline)
(search-for-primes 10000 10040)
(newline)
(search-for-primes 100000 100050)
(newline)
(search-for-primes 1000000 1000040)
(newline)
; This procedure iterates through and runs the procedure on every odd number in the range. That's why the upper limit is only set so that only 3 prime numbers are found.


; The problem with this procedure is that computers are way too fast now to see any real difference in elapsed time.
; To make it more noticable one thing that could be done is to increase complexity of the function, the other is to just input larger numbers.
(search-for-primes 10000000000000000 10000000000000080) ; The number had to be atleast this large to see any noticable delay on my device.
(newline)
(search-for-primes 1000000000000000000 1000000000000000040)


;The outputs are as follows.
15
17 *** 0.001220703125
19 *** 0.00146484375
21
23 *** 0.0009765625
25
27

1001
1003
1005
1007
1009 *** 0.0029296875
1011
1013 *** 0.0029296875
1015
1017
1019 *** 0.002685546875

10001
10003
10005
10007 *** 0.009765625
10009 *** 0.007080078125
10011
10013
10015
10017
10019
10021
10023
10025
10027
10029
10031
10033
10035
10037 *** 0.007568359375
10039 *** 0.0068359375

100001
100003 *** 0.020263671875
100005
100007
100009
100011
100013
100015
100017
100019 *** 0.0205078125
100021
100023
100025
100027
100029
100031
100033
100035
100037
100039
100041
100043 *** 0.01953125
100045
100047
100049 *** 0.0205078125

1000001
1000003 *** 0.055908203125
1000005
1000007
1000009
1000011
1000013
1000015
1000017
1000019
1000021
1000023
1000025
1000027
1000029
1000031
1000033 *** 0.05615234375
1000035
1000037 *** 0.056640625
1000039 *** 0.057861328125

10000000000000001
10000000000000003
10000000000000005
10000000000000007
10000000000000009
10000000000000011
10000000000000013
10000000000000015
10000000000000017
10000000000000019
10000000000000021
10000000000000023
10000000000000025
10000000000000027
10000000000000029
10000000000000031
10000000000000033
10000000000000035
10000000000000037
10000000000000039
10000000000000041
10000000000000043
10000000000000045
10000000000000047
10000000000000049
10000000000000051
10000000000000053
10000000000000055
10000000000000057
10000000000000059
10000000000000061 *** 6722.01220703125
10000000000000063
10000000000000065
10000000000000067
10000000000000069 *** 6618.156982421875
10000000000000071
10000000000000073
10000000000000075
10000000000000077
10000000000000079 *** 7080.62890625

1000000000000000001
1000000000000000003 *** 67770.37329101563
1000000000000000005
1000000000000000007
1000000000000000009 *** 64673.49462890625
1000000000000000011
1000000000000000013
1000000000000000015
1000000000000000017
1000000000000000019
1000000000000000021
1000000000000000023
1000000000000000025
1000000000000000027
1000000000000000029
1000000000000000031 *** 73730.62036132813
1000000000000000033
1000000000000000035
1000000000000000037
1000000000000000039

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



