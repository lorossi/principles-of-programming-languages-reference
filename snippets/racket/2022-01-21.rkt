#lang racket

(define-syntax block
 (syntax-rules (then where <-)
  ((_ (case1 ...)
  then (case2 ...)
  where (v <- a b) ...)
    (begin
      ((let ((v a) ...) case1 ...)
      (let ((v b) ...) case2 ...))))))

(block
  ((displayln (* x y)))
  then
  ((displayln (+ x y)))
  where
  (x <- 2 0)
  (y <- 3 2))
