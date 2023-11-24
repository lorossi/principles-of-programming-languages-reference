; https://www.codewars.com/kata/5b40b666dfb4291ad9000049/train/racket
#lang racket

(define (solve a b c alpha beta gamma)
  (define (move x y rho theta)
    (let [(theta_rad (deg2rad theta))]
      (list (+ x (* rho (cos theta_rad))) (+ y (* rho (sin theta_rad)))))
    )

  (define (deg2rad theta)
    (* theta (/ pi 180)))

  (define (rad2deg theta)
    (* theta (/ 180 pi)))

  (define (deg2dec theta)
    (letrec [(deg (exact-truncate (floor theta)))
             (min (exact-truncate (floor (* 60 (- theta deg)))))
             (sec (exact-truncate (floor (* 60 (- (* 60 (- theta deg)) min)))))]
      (list deg min sec)))

  (define (atan2 y x)
    (+ 180 (rad2deg (atan (/ y x)))))


  (letrec
      ((A (move 0 0 a alpha))
       (B (move (list-ref A 0) (list-ref A 1) b (+ beta 90)))
       (C (move (list-ref B 0) (list-ref B 1) c (+ gamma 180)))
       (D (exact-round(sqrt (+ (expt (list-ref C 0) 2) (expt (list-ref C 1) 2)))))
       (toc (deg2dec (atan2 (list-ref C 1) (list-ref C 0)))))
    (flatten (list D toc))))

(println (solve 12 20 18 45 30 60)) ;=> (15, 135, 49, 18)
(println (solve 15 15 19 50 29 55)) ;=>  '(12  133  18  44))
(println (solve 14 25 17 41 35 59)) ;=>  '(20  129  41  57))
(println (solve 6 23 14 47 34 61)) ;=>  '(19  144  13  14))