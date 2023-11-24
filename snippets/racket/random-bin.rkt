#lang racket

;; (multifun (f g) (x) ((+ x x x) (* x x x)))
(define-syntax multifun
  (syntax-rules ()
    [(_ (f) (args ...) (body))
     (define (f args ...)  (begin body))]
    [(_ (f . fs) (args ...) (body . bodies))
     (begin
       (define (f args ...) (begin body))
       (multifun fs (args ...) bodies))]))

(multifun (f g) (x) ((+ x x x) (* x x x)))
(println (f 3))
(println (g 3))