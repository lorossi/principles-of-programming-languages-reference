; count the number of duplicates in a string
; https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/racket

#lang racket

(define (count_c c xs)
  (let ([accumulator 0])
    (for-each
     (lambda (x) (when (equal? x c) (set! accumulator (add1 accumulator))))
     (string->list xs))
    accumulator))

(define (duplicate-count xs)
  (let ([accumulator 0])
    (for-each
     (lambda (x) (let ((current (count_c x (string-upcase xs))))
                   (when (> current 1) (set!  accumulator (add1 accumulator)))))
     (build-list 43 (lambda (x) (integer->char (+ 48 x)))))
    accumulator))

; shortest solution:


(define (duplicate-count-2 xs)
  (let* ([x-lst (string->list (string-downcase xs))]
         [x-unique (remove-duplicates x-lst)]
         [x-filtered (filter (λ (x) ((count (curry eq? x) x-lst) . > . 1)) x-unique)])
    (length x-filtered)))