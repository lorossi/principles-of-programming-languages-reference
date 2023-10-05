; Write a function partlist that gives all the ways to divide a list (an array) of at least two elements into two non-empty parts.
; https://www.codewars.com/kata/56f3a1e899b386da78000732/train/racket

#lang racket
(provide part-list)

(define (part-list ls)
  (define (partition ls n acc)
    (if (= n (length ls))
        acc
        (partition ls
                   (add1 n)
                   (append acc (list (list
                                      (string-join (take ls n) " ")
                                      (string-join (drop ls n) " ")))))))
  (partition ls 1 '()))

(part-list '("if" "there" "was" "more" "well-being" "in" "the" "world" "and" "everyone" "considered" "himself" "his" "brother" "there" "would" "be" "less" "thought" "and" "less" "sorrow" "and" "the" "world" "would" "be" "much" "more" "beautiful"))

; could be done in a faster way using for/list
