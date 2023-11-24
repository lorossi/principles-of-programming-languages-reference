; Pascal sum
; https://www.codewars.com/kata/559b8e46fa060b2c6a0000bf/train/racket

#lang racket

(define (factorial x)
  (define (factorial-inner x)
    (if (<= x 1)
        x
        (* x (factorial-inner (sub1 x)))))
  (factorial-inner x))

(define (binomial n k)
  (/ (factorial n) (* (factorial k) (factorial (- n k)))))

(define (diagonal n p)
  (define )
  )


; your code
(println (diagonal 20 3)) ;=> 5985
(println (diagonal 20 4)) ;=> 20349
