; Tortoise racing
; https://www.codewars.com/kata/55e2adece53b4cdcb900006c/train/racket

#lang racket
(provide race)

(define (race v1 v2 g)
  (if
   (>= v1 v2)
   null
   (letrec [(delta (/ g (- (/ v2 3600) (/ v1 3600))))
            (hours (floor (/ delta 3600)))
            (minutes (floor (/ (- delta (* hours 3600)) 60)))
            (seconds (floor (- delta (* hours 3600) (* minutes 60))))]
     (list hours minutes seconds))))

(race 720 850 70); => [0, 32, 18] or "0 32 18"
(race 80 91 37);   => [3, 21, 49] or "3 21 49"
