#lang play

(require "start.rkt")

(test (zipWith '(1 3) '(2 4 6) +) '(3 7))
(test (zipWith '(1 2 3) '(1 2 3) equal?) '(#t #t #t))
(test (zipWith '(3 4 10) '(3 5 2) [λ(x y)(expt x y)]) '(27 1024 100))
(test (zipWith '(1 3) '(2) +) '(3))

(test (zip '(1 2 3) '(3 2 1)) '((1 . 3) (2 . 2) (3 . 1)))
(test (zip '(8 9 10 11 13) '(11 10 9)) '((8 . 11) (9 . 10) (10 . 9)))
(test (zip '(1 2 3) '(hola chao)) '((1 . hola) (2 . chao)))
(test (zip '(#t #f #f) '(1 hola true)) '((#t . 1) (#f . hola) (#f . true)))

(test (eq-fun odd? odd? 0 10) 11)
(test (eq-fun odd? even? 4 8) 0)
(test (eq-fun (λ(x)(>= x 8)) (λ(y)(<= y 10)) 6 16) 3)

(test (listIntervalo 1 1) '(1))
(test (listIntervalo 2 1) '())
(test (listIntervalo 1 3) '(1 2 3))
(test (listIntervalo 4 8) '(4 5 6 7 8))

