;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;           MODULO MAIN           ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule MAIN 
	(export deftemplate nodo)
	(export deffunction heuristica))

(deftemplate MAIN::nodo
   (multislot estado)
   (multislot camino)
   (slot heuristica)
   (slot clase (default abierto)))

(defglobal MAIN
   ?*estado-inicial* = (create$ 2 8 3 1 6 4 7 H 5)
   ?*estado-final* = (create$ 1 2 3 8 H 4 7 6 5))

(deffunction MAIN::heuristica ($?estado)
   (bind ?res 0)
   (loop-for-count (?i 1 9)
    (if (neq (nth ?i $?estado)
             (nth ?i ?*estado-final*))
         then (bind ?res (+ ?res 1))
     )
    )
   ?res)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     MODULO MAIN::INICIAL        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule MAIN::inicial
   =>
   (assert (nodo 
              (estado ?*estado-inicial*)
              (camino)
              (heuristica (heuristica ?*estado-inicial*))
              ))
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MODULO MAIN::CONTROL(PRIORIDAD) ;;;
;;; PRIMERO EL MEJOR                ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule MAIN::pasa-el-mejor-a-cerrado
   ?nodo <- (nodo (clase abierto) 
                  (heuristica ?h1))
   (not (nodo (clase abierto)
              (heuristica ?h2&:(< ?h2 ?h1))))
=> 
   (modify ?nodo (clase cerrado))
   (focus OPERADORES))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;      MODULO OPERACIONES         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule OPERADORES
   (import MAIN deftemplate nodo)
   (import MAIN deffunction heuristica))

(defrule OPERADORES::arriba
   (nodo (estado $?a ?b ?c ?d H $?e)
          (camino $?movimientos)
          (clase cerrado))
=>
   (bind $?nuevo-estado (create$  $?a H ?c ?d ?b $?e))
   (assert (nodo 
		      (estado $?nuevo-estado)
              (camino $?movimientos ^)
              (heuristica (heuristica $?nuevo-estado)))))

(defrule OPERADORES::abajo
   (nodo (estado $?a H ?b ?c ?d  $?e)
          (camino $?movimientos)
          (clase cerrado))
=>
   (bind $?nuevo-estado (create$ $?a ?d ?b ?c H $?e))
   (assert (nodo 
              (estado $?nuevo-estado)
              (camino $?movimientos v)
              (heuristica (heuristica $?nuevo-estado)))))
              
(defrule OPERADORES::izquierda
   (nodo (estado $?a&:(neq (mod (length $?a) 3) 2)
                   ?b H $?c)
          (camino $?movimientos)
          (clase cerrado))
=>
   (bind $?nuevo-estado (create$ $?a H ?b $?c))
   (assert (nodo 
		      (estado $?nuevo-estado)
              (camino $?movimientos <)
              (heuristica (heuristica $?nuevo-estado)))))

(defrule OPERADORES::derecha
   (nodo (estado $?a H ?b
                 $?c&:(neq (mod (length $?c) 3) 2))
          (camino $?movimientos)
          (clase cerrado))
 =>
   (bind $?nuevo-estado (create$ $?a ?b H $?c))
   (assert (nodo 
		      (estado $?nuevo-estado)
              (camino $?movimientos >)
              (heuristica (heuristica $?nuevo-estado)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;      MODULO RESTRICCIONES       ;;;
;;; OJO ESTA REGLA NO ESTA BIEN  ...;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule RESTRICCIONES
   (import MAIN deftemplate nodo))

(defrule RESTRICCIONES::repeticiones-de-nodo
   (declare (auto-focus TRUE))
   (nodo (estado $?actual)
         (camino $?movimientos-1))
   ?nodo <- (nodo (estado $?actual)
                  (camino $?movimientos-1 ? $?))
 =>
   (retract ?nodo))
   
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;    MODULO MAIN::SOLUCION        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule SOLUCION
   (import MAIN deftemplate nodo))

(defrule SOLUCION::reconoce-solucion
   (declare (auto-focus TRUE))
   ?nodo <- (nodo (estado 1 2 3 8 H 4 7 6 5)
               (camino $?movimientos))
 => 
   (retract ?nodo)
   (assert (solucion $?movimientos)))

(defrule SOLUCION::escribe-solucion
   (solucion $?movimientos)
  =>
   (printout t "Solucion:" $?movimientos crlf)
   (halt))


