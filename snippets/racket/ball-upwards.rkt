; Write a function max_ball with parameter v (in km per hour) that returns the time in tenth of second of the maximum height recorded by the device.
; https://www.codewars.com/kata/566be96bb3174e155300001b/train/racket

#lang racket

(define (max-ball v0)
  (exact-round (/ v0 3.5316)))

(max-ball 15)
(max-ball 45)