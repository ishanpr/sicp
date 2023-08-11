#lang scheme

;Row 1 is the row at the top of the triangle
;Column 1 is the left-most number in a row
;Column n is the nth number (or right-most number) in row n

 (define (pascal r c) 
   (cond ((= c 1)1)
         ((= c r)1)
         ((> c r)0) 
       ((+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))) 
  

  
