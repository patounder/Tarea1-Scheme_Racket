#lang play


(deftype Card
  (spades number)
  (hearts number)
  (diamonds number)
  (clubs number))

(deftype Melt
  (str rank fst)
  (toak num))

(foldr (λ (c i)
         (if (equal? i empty)
             (list (list c))
             (if (= (spades-number c) (sub1 (spades-number (car (car i))) ))
                 (cons (append (list c) (car i)) (cdr i))
                 (cons (list c) i)
                 )
             ))
       '()
       (list (spades 1) (spades 2) (spades 3) (spades 4) (spades 5) (spades 6) (spades 7) (spades 8) (spades 9))
       )

       
#|

(list (spades 1) (spades 2) (spades 4)) -> (list (list (spades 1) (spades 2)) (list (spades 4)) )

|#

