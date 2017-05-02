;;; Scheme Recursive Art Contest Entry

;;; Please do not include your name or personal info in this file.

;;; Title: <Relativity Stairs>

;;; Description:
;;;   <These are stairs.
;;;    Gravity does not apply.
;;;    Up and down they go.>

;;; Stairs inspired by M. C. Escher's never ending staircase drawings.

(define (draw)
(define x (list   "#F2784B" "#F2784B" "#F2784B" "#F2784B" "#F2784B"))
(bgcolor "black")
(goto -10 -300)
(clear)

(define (change lst amount)
	(cond 
		((= amount 1) lst)
		(else (change (cdr lst) (- amount 1)))))

(define (change-up lst amount)
	(cond 
		((= amount 1) lst)
		((> amount 4) (list "#F2784B"))
		((< amount 1) (list "#F2784B"))
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
			(stairs-left wid len dep 5 5))
		(else (rect wid len dep) (stairs-right (/ wid (/ 11 10)) (/ len (/ 11 10)) (/ dep (/ 11 10)) (- am 1)))))

(define (stairs-left wid len dep am colornum)
	(speed 0)
	(color (car (change x colornum)))
	(cond 
		((= am 1) (rect-left wid len dep)
			(left 90)
			; (forward dep)			
			(left 90)
			(right 0)
			(stairs-left-two wid len dep 5))
		(else (rect-left wid len dep) (stairs-left (/ wid (/ 11 10)) (/ len (/ 11 10)) (/ dep (/ 11 10)) (- am 1) (- colornum 1)))))

(define (stairs-left-two wid len dep am)
	(speed 0)
	(color (car (change-up x am)))
	(cond 
		((= am 1) (rect wid len dep)
			(left 90)
			(forward wid)
			(right 90)
			(stairs-left-three wid len dep 3))
		(else (rect wid len dep) (stairs-left-two (/ wid (/ 9 10)) (/ len (/ 9 10)) (/ dep (/ 9 10)) (- am 1)))))

(define (stairs-left-three wid len dep am)
	(speed 0)
	(color (car (change-up x am)))
	(cond 
		((= am 1) (rect-left wid len dep)
			(right 90)
			(forward wid)
			(left 90))
		(else (rect-left wid len dep) (stairs-left-three (/ wid (/ 9 10)) (/ len (/ 9 10)) (/ dep (/ 9 10)) (- am 1)))))

(stairs-right 125 30 32 (- (length x)1))

(end_fill)
(penup)
(bgcolor "Black")
(color "#003333")
(penup)
(ht)
)

(exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)