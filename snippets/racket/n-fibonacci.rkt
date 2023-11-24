#lang racket
(provide n-fibonacci)

(define (n-fibonacci n m)
  (define (inner-tetranacci n m mem)

    (cond
      [(<= n 0) 0]
      [(hash-has-key? mem n) (hash-ref mem n)]
      [(let ([result
              (apply + (for/list ([i (in-range 0 m)])
                         (inner-tetranacci (- n (add1 i)) m mem)))])
         (hash-set! mem n result)
         result)]))

  (let ([memory (make-hash)])
    (for/list ([i (in-range 0 m)])
      (hash-set! memory i 0))
    (hash-set! memory m 1)
    (inner-tetranacci n m memory)))

(define values (for/list ([i (in-range 0 10)])
                 (n-fibonacci (add1 i) 4)))
(for ([i (in-range 0 10)])
  (printf "~a) ~a\n" (add1 i) (list-ref values i)))



