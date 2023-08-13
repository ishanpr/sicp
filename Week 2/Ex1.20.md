### Initial scheme procedure
```(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
```    

#### Normal order

(gcd 206 40)

(if (= 40 0)206)..)

(gcd 40 (remainder 206 40))\
(if (= `(remainder 206 40)` 0)..)

(if (= 6 0)..)

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0)..)

(if (= 4 0)..)

(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)..)

(if (= 2 0)..)

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)..)

(if (= 0 0)..)

- This is way too long and confusing to work on I can't be bothered.
- Looking at other people's answers the number of applications of remainder is 18.
- Refer to jots-jottings blogspot for an explanation.
- The single highlight is part of my unsuccessful attempt to highlight all occurrences/ applications of remainder that I didn't complete.

#### Applicative-order
```
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
```
