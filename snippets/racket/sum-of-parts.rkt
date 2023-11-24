; https://www.codewars.com/kata/5ce399e0047a45001c853c2b/racket

#lang racket

(define (parts-sums ls)
  (define (inner-sum ls out)
    (if (empty? ls)
        out
        (inner-sum
         (rest ls)
         (append out (list (- (last out) (first ls)))))))

  (inner-sum ls (list (apply + ls))))

(println (parts-sums '(0 1 3 6 10))) ; => '(20 20 19 16 10 0)
(println (parts-sums '(1 2 3 4 5 6))) ; =>  '(21 20 18 15 11 6 0))