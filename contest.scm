;;; Scheme Recursive Art Contest Entry

;;; Please do not include your name or personal info in this file.

;;; Title: <Your title here>

;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

; (define (draw)

; (define x (list   "#87CEFA" "#87CEFA" "#87CEFA" "#87CEFA" "#87CEFA" "#87CEFA" "#87CEFA" "#87CEFA" "#7BBBE3" "#7BBBE3" "#6EA9CD" "#6EA9CD" "#6296B6" "#6296B6" "#56839F" "#56839F" "#4A7088" "#3D5E72" "#314B5B" "#253844" "#19252D" "#0C1317" "#000000"))
(define x (list   "#87CEFA" "#87CEFA" "#87CEFA" "#87CEFA" "#000000"))

(bgcolor "black")
; (bgpic "runway-models-56a631543df78cf7728bc513.gif")


(goto -50 -300)

(clear)


(define (change lst amount)
	(cond 
		((= amount 1) lst)
		(else (change (cdr lst) (- amount 1)))))

(define (base size repeat)
	(cond
		((= repeat 0) 
			(forward size)
			(right 45))
		(else 
	(forward size)
	(right 45)
	(base size (- repeat 1)))))

(define (rectangle width hight)
	(speed 0)
	(forward hight)
     (right 90)
     (forward width)
     (right 90)
     (forward hight)
     (right 90)
     (forward width)
     (right 90)
     (forward hight)
     )

(define (rect-left wid len dep)
	(speed 0)
	
	(rectangle wid len)
	(begin_fill)
	(left 60)
	(forward dep)
	(right 150)
	(forward wid)
	(right 30)
	(forward dep)
	(right 180)
	(forward dep)
	(forward dep)
	(forward dep)
	(forward dep)

	(left 30)
	(forward wid)
	(right 90)
	(end_fill)
	)
	
(define (rect wid len dep)
	(speed 0)
	(begin_fill)
	
	(left 90)
	(forward wid)
	(right 90)
     (rectangle wid len)
     (right 90)
     (forward wid)
     (left 30)
     (forward dep)
     (forward dep)
     (forward dep)
     (forward dep)

     (left 150)
     (forward wid)
     (left 30)
     (forward dep)
     (backward dep)
     (left 150)
     (forward wid)
     (left 90)
     (end_fill)

     )

(define (stairs-right wid len dep am)
	(speed 0)
	(color (car (change x am)))
	(cond 
		((= am 1) (rect wid len dep)
			(left 90)
			(forward wid)
			(right 90)
			(stairs-left wid len dep 4 4))
		(else (rect wid len dep) (stairs-right (/ wid (/ 11 10)) (/ len (/ 11 10)) (/ dep (/ 11 10)) (- am 1)))))


(define (stairs-left wid len dep am colornum)
	(speed 0)
	(color (car (change x colornum)))
	(cond 
		((= am 1) (rect-left wid len dep)
			(left 60)
			; (forward dep)			
			(left 90)
			; (forward dep)
			(right 0)
			(stairs-left-two wid len dep 4 4))
		(else (rect-left wid len dep) (stairs-left (/ wid (/ 11 10)) (/ len (/ 11 10)) (/ dep (/ 11 10)) (- am 1) (- colornum 1)))))

(define (stairs-left-two wid len dep am colornum)
	(speed 0)
	(color (car (change x colornum)))
	(cond 
		((= am 1) (rect-left wid len dep)
			(right 90)
			(forward wid)
			(left 90))
		(else (rect wid len dep) (stairs-left-two (/ wid (/ 11 10)) (/ len (/ 11 10)) (/ dep (/ 11 10)) (+ am 1) (- colornum 1)))))

(stairs-right 125 30 30 (- (length x)1))

	

	(end_fill)





(penup)


(bgcolor "Black")
; (bgpic "runway-models-56a631543df78cf7728bc513.gif")

(color "#003333")
(penup)
; 
(ht)


  ; (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
; (draw)