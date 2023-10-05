; this script calculates pi using the Leibniz formula
; as input it accepts the desired precision
; the output is a list containing the number of iterations and the calculated value of pi

#lang racket
(provide iter-pi)

(define (iter-pi epsilon)
  (define (iter-step n a)
    (if (< (abs (- a pi)) epsilon)
        (list n (/ (round (* 1e10 a) ) 1e10))
        (iter-step (add1 n) (+ a (* 4 (/ (expt -1 n) (add1 (* 2 n))))))))
  (iter-step 0 0.0))

(iter-pi 0.01)



