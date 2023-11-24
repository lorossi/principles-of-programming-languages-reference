; https://www.codewars.com/kata/562e274ceca15ca6e70000d3/train/racket

#lang racket
; calculate the length of f(x) = x**2 between x = 0 and x = 1, using N points equally spaced in x.
(define (len-curve n) 0)


(define (valid n expected)
  (< (abs (- (len-curve n) expected)) 1e-6))

(println (valid 1 1.414213562))
(println (valid 10 1.478197397))
(println (valid 40 1.478896272))