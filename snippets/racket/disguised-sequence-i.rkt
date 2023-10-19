; Given u0 = 1, u1 = 2 and the relation 6 u_n u_(n+1)-5 u_n u_(n+2) + u_(n+1) u_(n+2) = 0 calculate un for any integer n >= 0.
; https://www.codewars.com/kata/563f0c54a22b9345bf000053/train/racket

#lang racket
(provide fcn)

(define (fcn n)
  (define (fcn-inner n mem)
    (if
     (hash-has-key? mem n)
     (hash-ref mem n)
     (letrec ([x (fcn-inner (- n 2) mem)]
              [y (fcn-inner (- n 1) mem)]
              [z (/ (* 6 x y) (- (* 5 x ) y))])
       (hash-set! mem n z)
       (hash-ref mem n)
       z)))

  (let ([memory (make-hash)])
    (hash-set! memory 0 1)
    (hash-set! memory 1 2)
    (fcn-inner n memory)))

(define (test n expected)
  (let ([actual (fcn n)])
    (printf "Expected: ~a, Actual: ~a, Equal: ~a\n" expected actual (equal? expected actual))))

(test 0 1)
(test 1 2)
(test 17 131072)
(test 21 2097152)
(test 398 645562469521727147413979793000752968582426448207305878207664839135161905504210298657411338320034457858975792993186873344)
