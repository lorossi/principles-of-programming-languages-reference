#lang racket
(provide fibonacci)

(define (fibonacci n)
  (define (inner-fibonacci n mem)
    (if
     (hash-has-key? mem n)
     (hash-ref mem n)
     (let ([result (+ (inner-fibonacci (- n 1) mem) (inner-fibonacci (- n 2) mem))])
       (hash-set! mem n result)
       result)))

  (let ([memory (make-hash)])
    (hash-set! memory 0 1)
    (hash-set! memory 1 1)
    (inner-fibonacci n memory)))

