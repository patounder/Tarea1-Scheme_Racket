#lang play
(require "start.rkt")

(test (two-str (list (clubs 1) (hearts 1) (diamonds 1)
                       (clubs 4) (hearts 4) (spades 4)
                       (spades 5) (spades 6) (spades 7)))
      '())

(test (puntaje-ronda two-str (list (clubs 1) (hearts 1) (diamonds 1)
                       (clubs 4) (hearts 4) (spades 4)
                       (spades 5) (spades 6) (spades 7))) 75)

(test (best-play (list (clubs 1) (hearts 1) (diamonds 1)
                       (clubs 4) (hearts 4) (spades 4)
                       (spades 5) (spades 6) (spades 7)))
      "one-str-one-toak")

(test (best-play (list (clubs 1) (hearts 1) (diamonds 1)
                       (clubs 4) (hearts 4) (spades 4)
                       (diamonds 6) (clubs 6) (spades 6)))
      "three-toak")

(test (puntaje-ronda three-toak (list (clubs 1) (hearts 1) (diamonds 1)
                                      (clubs 4) (hearts 4) (spades 4)
                                      (diamonds 6) (clubs 6) (spades 6)))
      0)

(test (puntaje-ronda one-str-one-toak (list (clubs 1) (hearts 1) (diamonds 1)
                                             (clubs 4) (hearts 4) (spades 4)
                                             (diamonds 6) (clubs 6) (spades 6)))
      75)


      
(test (puntaje-ronda two-toak (list (spades 1) (hearts 1) (diamonds 1)
                                    (clubs 3) (hearts 3) (diamonds 3)
                                    (clubs 2) (hearts 2) (diamonds 2)))
      6)


(test (puntaje-ronda three-toak (list (spades 1) (hearts 1) (diamonds 1)
                                    (clubs 3) (hearts 3) (diamonds 3)
                                    (clubs 2) (hearts 2) (diamonds 2)))
      0)

(test (puntaje-ronda one-str-one-toak (list (clubs 10) (hearts 2) (diamonds 2)
                                            (clubs 2) (hearts 4) (diamonds 4)
                                            (clubs 7) (clubs 8) (clubs 9)))
      8)

(test (puntaje-ronda one-str-one-toak (list (clubs 11) (hearts 2) (diamonds 2)
                                            (clubs 2) (hearts 4) (diamonds 4)
                                            (clubs 7) (clubs 8) (clubs 9)))
      48)


      

(test (two-str (list (clubs 1) (clubs 3) (clubs 2)
                      (clubs 5) (clubs 4) (clubs 7)
                      (clubs 9) (clubs 8) (clubs 6)))
      '())

(test (two-str (list (clubs 1) (clubs 3) (clubs 2)
                      (hearts 5) (clubs 4) (hearts 7)
                      (clubs 9) (hearts 8) (diamonds 6)))
      '())


(test (two-str (list (spades 1) (hearts 1) (diamonds 1)
                      (clubs 3) (hearts 3) (diamonds 3)
                      (clubs 2) (hearts 2) (diamonds 2)))
      '())

(test (two-str (list (clubs 3) (hearts 1) (hearts 2)
                      (clubs 1) (hearts 3) (diamonds 3)
                      (clubs 2) (hearts 4) (clubs 4)))
      (list (str "hearts" 1) (str "clubs" 1)))

(test (two-str (list (hearts 1) (hearts 2) (hearts 3)
                     (hearts 4) (clubs 1) (hearts 7) 
                     (hearts 8) (hearts 9) (hearts 10)))
      '())




(test (one-str-one-toak (list (clubs 10) (clubs 11) (diamonds 2)
                              (clubs 2) (hearts 4) (diamonds 4)
                              (clubs 7) (clubs 8) (clubs 9)))
      '())
      
(test (one-str-one-toak (list (clubs 10) (hearts 3) (diamonds 2)
                              (clubs 2) (hearts 4) (diamonds 4)
                              (clubs 7) (clubs 8) (clubs 9)))
      '())
      
(test (one-str-one-toak (list (clubs 10) (hearts 2) (diamonds 2)
                              (clubs 2) (hearts 4) (diamonds 4)
                              (clubs 7) (clubs 4) (clubs 9)))
      '())
      
(test (one-str-one-toak (list (clubs 10) (hearts 2) (diamonds 2)
                              (clubs 2) (hearts 4) (diamonds 4)
                              (clubs 7) (clubs 8) (clubs 9)))
      (list (str "clubs" 7) (toak 2)))
      


(test (zipWith '() '(2 4 6) +) '())
(test (zipWith '(1 2 3) '(1 2 3) equal?)
'(#t #t #t))
(test (zipWith '(1 3) '(2 4 6) +)
'(3 7))

(test (zip '() '(1 2 3)) 
      '())
(test (zip '(1 2 3) '(3 2 1))
      '((1 . 3) (2 . 2) (3 . 1)))
(test (zip '(8 9 10 11 13) '(11 10 9))
      '((8 . 11) (9 . 10) (10 . 9)))


(test (eq-fun odd? odd? 0 0) 
      1)
(test (eq-fun odd? odd? 0 10)
      11)
(test (eq-fun odd? even? 4 8)
      0)
(test (eq-fun (lambda(x) (< 2 x)) (lambda(x) (< 3 x)) 0 4) 
      4)




(test (sep-list '() ) 
      '())
(test (sep-list '(3 1 5 6 1 1 1 3 4))
      '((3) (1) (5) (6) (1 1 1) (3) (4)))
(test (sep-list '(#t #t #f #f #t #t))
      '((#t #t) (#f #f) (#t #t)))





(test (ranked-hand? (list (spades 1) (spades 1) (spades 1)
                      (spades 3) (spades 3) (spades 3)
                      (spades 2) (spades 2) (spades 2))) #t)


(test (ranked-hand? (list (spades 1) (hearts 1) (diamonds 1)
                      (clubs 3) (hearts 3) (diamonds 3)
                      (clubs 2) (hearts 2) (diamonds 2))) #f)
(test (ranked-hand? (list (spades 1) (spades 1) (spades 1)
                      (spades 3) (spades 3) (spades 3)
                      (clubs 2) (spades 2) (spades 2))) #f)


(test (two-toak (list (spades 1) (hearts 13) (diamonds 1)
                      (clubs 3) (hearts 13) (diamonds 3)
                      (clubs 2) (hearts 13) (diamonds 3)))
      (list (toak 13) (toak 3)))

(test (two-toak (list (spades 1) (hearts 3) (diamonds 1)
                      (clubs 4) (hearts 11) (diamonds 3)
                      (clubs 2) (hearts 13) (diamonds 6)))
      '())
(test (two-toak (list (spades 1) (hearts 1) (diamonds 1)
                      (clubs 3) (hearts 3) (diamonds 3)
                      (clubs 2) (hearts 2) (diamonds 2)))
      (list (toak 1) (toak 3)))

(test (two-toak (list (spades 1) (hearts 1) (diamonds 1)
                      (clubs 2) (hearts 3) (diamonds 4)
                      (clubs 7) (hearts 6) (diamonds 5)))
      '())

(test (three-toak (list (spades 1) (hearts 1) (diamonds 1)
                      (clubs 3) (hearts 3) (diamonds 3)
                      (clubs 2) (hearts 2) (diamonds 2)))
      (list (toak 1) (toak 3) (toak 2) ))

(test (three-toak (list (spades 1) (hearts 1) (diamonds 1)
                      (clubs 13) (hearts 3) (diamonds 3)
                      (clubs 2) (hearts 2) (diamonds 2)))
      '())
(test (three-toak (list (spades 1) (hearts 1) (diamonds 1)
                      (clubs 2) (hearts 3) (diamonds 4)
                      (clubs 7) (hearts 6) (diamonds 5)))
      '())



;; ;; straight-hand? :: (Listof Cards) -> Bool
(test (straight-hand? (list (spades 1) (hearts 2) (diamonds 5)
                      (clubs 8) (hearts 3) (diamonds 4)
                      (clubs 7) (hearts 6) (diamonds 9))) #t)

(test (straight-hand? (list (spades 13) (hearts 2) (diamonds 5)
                            (clubs 8) (hearts 3) (diamonds 4)
                            (clubs 7) (hearts 6) (diamonds 9))) #f)

(test (straight-hand? (list (spades 9) (hearts 2) (diamonds 5)
                            (clubs 8) (hearts 3) (diamonds 4)
                            (clubs 7) (hearts 6) (diamonds 9))) #f)

(test (straight-hand? (list (spades 2) (hearts 2) (diamonds 5)
                            (clubs 8) (hearts 3) (diamonds 4)
                            (clubs 7) (hearts 6) (diamonds 9))) #f)