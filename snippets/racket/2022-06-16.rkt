#lang racket

(define list-to-compose (lst)
    (foldr (lambda (x y) (list x y)) '() lst))

