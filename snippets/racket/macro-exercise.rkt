#lang racket

(define-syntax macro-while
  (syntax-rules ()
    [(_ cond body ...)
     (let loop ()
       (when cond
         (begin body ...)
         (loop)))]))

(define-syntax macro-for
  (syntax-rules ()
    [(_ (var start end) body ...)
     (let loop ((var start))
       (when (< var end)
         (begin body ...)
         (set! var (add1 var))
         (loop var)))]))

(define-syntax macro-for-short
  (syntax-rules ()
    [(_ (start end) body ...)
     (let loop ((i start))
       (when (< i end)
         (begin body ...)
         (set! i (add1 i))
         (loop i)))]))

(let [(i 0)]
  (macro-while
   (< i 5)
   (set! i (add1 i))
   (println i)))

(macro-for
 (i 0 5)
 (printf "HELLO: ~a\n" i))

(macro-for-short
 (0 5)
 (printf "HELLO\n"))