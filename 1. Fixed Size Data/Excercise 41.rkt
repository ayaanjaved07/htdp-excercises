;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Excercise 41|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WHEEL-RADIUS 20)
(define BODY (* 2 WHEEL-RADIUS))
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle (* 2 BODY) BODY "solid" "blue"))
 
(define CAR (overlay/offset
 (overlay/offset WHEEL
                  BODY 0
                  WHEEL)
 0 (* -1 WHEEL-RADIUS)
 SPACE))
(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND (empty-scene 1000 200))
(define BG (place-image tree 10 50 BACKGROUND))
(define (render cw)
   (place-image CAR cw 50 BG))



;(place-image tree 10 50 BACKGROUND)

(define (tock cw) (+ cw 3))

(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]))