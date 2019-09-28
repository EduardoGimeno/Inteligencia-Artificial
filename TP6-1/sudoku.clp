;;; Eduardo Gimeno
;;; 721615
;;; 2018-11-15
;;; Trabajo TP6 1. IA Programación con reglas.
;;; Resolución de un Sudoku
;;; Empezado en la versión 6.24 -> Problemas
;;; Terminado en la versión 6.30
;;;============================================================================

;
;;;============================================================================
;;; Introducción
;;;============================================================================

;;; El programa resuelve sudokus utilizando primero propagación con restricciones
;;; y despues busquedas.

;;;============================================================================
;;; MODULO MAIN
;;;============================================================================
(defmodule MAIN 	
  (export deftemplate celda print nodo))
  
;;;----------------------------------------------------------------------------
;;; Representación del sudoku
;;;----------------------------------------------------------------------------

;;;   Utilizaremos la siguiente plantilla para representar cada una de las celdas del
;;;   sudoku en el proceso de propagación de restricciones. Los campos de una celda son:
;;; - fila: Número de fila en la que se encuentra la celda
;;; - columna: Número de columna en la que se encuentra la celda
;;; - caja: Número de caja en el que se encuentra la celda
;;; - rango: Rango de valores que se pueden colocar en la celda. Inicialmente
;;;   el rango son todos los valores numéricos de 1 a 9.
;;;   Una celda tendrá un valor asignado si y solo si dicho
;;;   valor es el único elemento del rango.
;;; - id: Identificador único de celda. Nos facilitará la expresión de pratrones
;;;   indicando que las celdas sean distintas.
;;; - acciones: marcamos las acciones que se han utilizado para eliminar valores del rango
;;;   Se puede eliminar tras depurar programa.


(deftemplate MAIN::celda
  (slot fila)
  (slot columna)
  (slot caja)
  (multislot rango
             (default (create$ 1 2 3 4 5 6 7 8 9)))
  (slot id (default 0))
  (slot estado (default cp))  ; cp, busqueda, asignado
  (multislot acciones)
  )

;;; Utilizamos la plantilla nodo para las búsquedas si el proceso de propagación de restricciones
;;; no ha completado el sudoku. 
;;; Estado nodo pares de celdas no resueltas con celda-id (opciones)
;;; Operador opcion y reglas restricciones.

(deftemplate MAIN::nodo
	     (multislot estado)
	     (multislot camino)
	     (slot coste (default 0))
	     (slot clase (default abierto)))

(deftemplate MAIN::print
	(slot estado))



;;;----------------------------------------------------------------------------
;;; Funciones auxiliares para generar sudoku a partir de una cadena
;;;----------------------------------------------------------------------------
;;; id cadena con implode$. Probar.
;;; Ejemplo 043080250600000000000001094900004070000608000010200003820500000000000005034090710


(deffunction MAIN::genera-sudoku-from-cadena (?cadena)  
	(bind ?fila 1)
	(bind ?columna 1)
	(bind ?caja 1)
	(bind ?contador 1) 
	(bind ?id 100)
     (loop-for-count (?i 1 (str-length ?cadena))
     	(bind ?value (string-to-field (sub-string ?i ?i ?cadena)))
     	(if (eq INTEGER (type ?value)) then (bind ?numero ?value)
     	                                else (bind ?numero 0))
   	 	;(bind ?numero (string-to-field (sub-string ?i ?i ?cadena)))
   	 	;(printout t ?id "num" ?numero "f" ?fila "c" ?columna "c" ?caja crlf)
	    (if (= ?numero 0)
	    		then (assert (celda (fila ?fila) (columna ?columna) (caja ?caja) (id ?id)))
   	 		else (assert (celda (fila ?fila) (columna ?columna) (caja ?caja) (rango ?numero)
			                                                                 (id ?id)))
   	 	)
   	 	(bind  ?id (+ ?id 1))

   	 	 (bind ?columna (+ ?columna 1))
   	 	 (if (> ?columna 9) 
   	 	 	then (progn 
   	 	 			(bind ?fila (+ 1 ?fila))
   	 	 			(bind ?columna 1))
		 ) 
		 	 
		 (bind ?caja (+ (* 3 (div (- ?fila 1) 3)) (+ (div (- ?columna 1) 3) 1)))
    		) 
 )

;;;----------------------------------------------------------------------------
;;; CONTROL en modulo main / BÚSQUEDA
;;;----------------------------------------------------------------------------

; Hacemos búsqueda expandiendo nodo con menos alternativas

; COMENTADA. UNA vez realizado el modulo CP descomentar.

(defrule MAIN::pasa-el-mejor-a-cerrado
	?nodo <- (nodo  (estado $?alternativas1)(clase abierto))
	(not (nodo (estado $?alternativas2&:(< (length$ ?alternativas2) (length$ ?alternativas1)))(clase abierto)))
	(not (nodo (clase solucion)))
	=>
	(modify ?nodo (clase cerrado))
	(focus CP_NODO)
	(focus OPERADORES))


   
;;;============================================================================
;;; MODULO BÚSQUEDAS /OPERADORES
;;;============================================================================

(defmodule NODO_INICIAL
	   (import MAIN deftemplate nodo)
	   (import MAIN deftemplate celda))
	  
;;;----------------------------------------------------------------------------
;;; NODO INICIAL
;;;----------------------------------------------------------------------------

;;;  Modulo que crea nodo inicial para búsqueda a partir celdas

(deffacts NODO_INICIAL::nodo-inicial
	(nodo (estado) (camino)))
	
; Para ordenar por longitud de alternativas	
(defrule NODO_INICIAL::contruye-nodo-inicial
	?nodo <- (nodo (estado $?estado))
	?celda <- (celda (id ?id) (rango $?alternativas&:(> (length$ ?alternativas) 1)) (estado cp))
	(not (celda (id ?id2&~?id) (estado cp) (rango $?alternativas2&:(and (> (length$ ?alternativas2) 1)
	                                                                    (< (length$ ?alternativas2)
									       (length$ ?alternativas))))))
	=>
	(modify ?nodo (estado ?estado ?id ?alternativas ?id ))
	(modify ?celda (estado busqueda))
	)



;;;----------------------------------------------------------------------------
;;; NODO INICIAL
;;;----------------------------------------------------------------------------

(defmodule OPERADORES
    (import MAIN deftemplate nodo)
    (import MAIN deftemplate celda))
   
(defrule OPERADORES::asigna-celda
	?nodo <- (nodo (estado ?id $? ?valor $? ?id $?resto)
		           (camino $?movimientos )(coste ?coste)(clase cerrado))=>
	(duplicate ?nodo  (estado $?resto)
	  			  	 (camino ?id ?valor ?movimientos)
				 	 (coste (+ ?coste 1))
				 	 (clase abierto))	 
)

		 	 

				 	 

;;;============================================================================
;;; MODULO CP_NODO: Estrategias de resolución / Propagación restricciones 
;;;                 durante la búsqueda
;;;============================================================================
(defmodule CP_NODO
	   (import MAIN deftemplate nodo celda))

(defrule CP_NODO::quita-valores-en-fila-del-nodo
    ?nodo <- (nodo (camino ?id1 ?valor $?)
                   (estado $?principio ?id2 $?av ?valor $?dv&:(>  (+ (length$ ?av) (length$ ?dv)) 0) ?id2 $?resto)
	               (clase abierto))
	(celda (id ?id1) (fila ?fila))
	(celda (id ?id2) (fila ?fila))
	=>
	(modify ?nodo (estado ?principio ?id2 ?av ?dv ?id2 ?resto) )
)

(defrule  CP_NODO::quita-celda-pendiente-en-fila-del-nodo
	?nodo <- (nodo (camino ?id1 ?valor $?)
		       (estado $? ?id2  ?valor ?id2 $?)
	               (clase abierto))
	(celda (id ?id1) (fila ?fila))
	(celda (id ?id2) (fila ?fila))
	=>
	(retract ?nodo)
)

(defrule CP_NODO::quita-valores-en-columna-del-nodo
    ?nodo <- (nodo (camino ?id1 ?valor $?)
                   (estado $?principio ?id2 $?av ?valor $?dv&:(>  (+ (length$ ?av) (length$ ?dv)) 0) ?id2 $?resto)
	               (clase abierto))
	(celda (id ?id1) (columna ?columna))
	(celda (id ?id2) (columna ?columna))
	=>
	(modify ?nodo (estado ?principio ?id2 ?av ?dv ?id2 ?resto) )
)

(defrule  CP_NODO::quita-celda-pendiente-en-columna-del-nodo
	?nodo <- (nodo (camino ?id1 ?valor $?)
		       (estado $? ?id2  ?valor ?id2 $?)
	               (clase abierto))
	(celda (id ?id1) (columna ?columna))
	(celda (id ?id2) (columna ?columna))
	=>
	(retract ?nodo)
)

(defrule CP_NODO::quita-valores-en-caja-del-nodo
    ?nodo <- (nodo (camino ?id1 ?valor $?)
                   (estado $?principio ?id2 $?av ?valor $?dv&:(>  (+ (length$ ?av) (length$ ?dv)) 0) ?id2 $?resto)
	               (clase abierto))
	(celda (id ?id1) (caja ?caja))
	(celda (id ?id2) (caja ?caja))
	=>
	(modify ?nodo (estado ?principio ?id2 ?av ?dv ?id2 ?resto) )
)

(defrule  CP_NODO::quita-celda-pendiente-en-caja-del-nodo
	?nodo <- (nodo (camino ?id1 ?valor $?)
		       (estado $? ?id2  ?valor ?id2 $?)
	               (clase abierto))
	(celda (id ?id1) (caja ?caja))
	(celda (id ?id2) (caja ?caja))
	=>
	(retract ?nodo)
)

;;;============================================================================
;;; MODULO CP: Estrategias de resolución / Propagación restricciones
;;;============================================================================

;;;----------------------------------------------------------------------------
;;; 1) Estrategia del valor asignado 
;;;----------------------------------------------------------------------------

;;; Si una celda tiene un único valor en su rango entonces dicho valor se
;;; puede eliminar del rango de cualquier otra celda distinta que esté situada
;;; en la misma fila, columna o caja.

;;; Implementa la estrategia del valor asignado con tres reglas: una por
;;; filas (valor-asignado-fila), otra por columnas (valor-asignado-columna) y
;;; una última por cajas (valor-asignado-caja).

(defmodule CP
   (import MAIN deftemplate celda))
   
(defrule CP::valor-asignado-fila
	(celda (fila ?fila) (columna ?columna) (rango ?valor))
	?celda <- (celda (fila ?fila) (columna ~?columna) (rango $?principio ?valor $?final)
					(acciones $?acciones))
=>
    (modify ?celda (rango ?principio ?final)
     	(acciones ?acciones (create$ valor-asignado-fila ?celda ?valor)))
    ) 

(defrule CP::valor-asignado-columna
	(celda (fila ?fila) (columna ?columna) (rango ?valor))
	?celda <- (celda (fila ~?fila) (columna ?columna) (rango $?principio ?valor $?final)
					(acciones $?acciones))
=>
	(modify ?celda (rango ?principio ?final)
		(acciones ?acciones (create$ valor-asignado-columna ?celda ?valor)))
	)
	
(defrule CP::valor-asignado-caja
	(celda (fila ?fila) (columna ?columna) (caja ?caja) (rango ?valor))
	?celda <- (celda (fila ~?fila) (columna ~?columna) (caja ?caja) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda (rango ?principio ?final)
		(acciones ?acciones (create$ valor-asignado-caja ?celda ?valor)))
	)
  
;;;----------------------------------------------------------------------------
;;; 2) Estrategia de los pares asignados 
;;;----------------------------------------------------------------------------

;;; Si dos celdas de la misma unidad (fila, columna o caja) tiene dos únicos
;;; valores en su rango entonces dichos valores se pueden eliminar del rango de
;;; cualquier otra celda distinta que esté situada en la misma unidad.

;;; Implementa la estrategia de los pares asignados con tres reglas: una por
;;; filas (par-asignado-fila), otra por columnas (par-asignado-columna) y
;;; una última por cajas (par-asignado-caja).

(defrule CP::par-asignado-fila
	?celda1 <- (celda (fila ?fila) (rango ?valor1 ?valor2)
				(acciones $?acciones))
	?celda2 <- (celda (fila ?fila) (rango ?valor1 ?valor2)
				(acciones $?acciones))
	(test (neq ?celda1 ?celda2))
	?celda3 <- (celda (fila ?fila) (rango $?principio ?valor1|?valor2 $?final))
    (test (and (neq ?celda1 ?celda3) (neq ?celda2 ?celda3)))
=>
	(modify ?celda3 (rango ?principio ?final)
		(acciones ?acciones (create$ par-asignado-fila ?celda3 ?valor1 ?valor2)))
	)

(defrule CP::par-asginado-columna
	?celda1 <- (celda (columna ?columna) (rango ?valor1 ?valor2)
				(acciones $?acciones))
	?celda2 <- (celda (columna ?columna) (rango ?valor1 ?valor2)
				(acciones $?acciones))
	(test (neq ?celda1 ?celda2))
	?celda3 <- (celda (columna ?columna) (rango $?principio ?valor1|?valor2 $?final))
    (test (and (neq ?celda1 ?celda3) (neq ?celda2 ?celda3)))
=>
	(modify ?celda3 (rango ?principio ?final)
		(acciones ?acciones (create$ par-asignado-fila ?celda3 ?valor1 ?valor2)))
	)

(defrule CP::par-asginado-caja
	?celda1 <- (celda (caja ?caja) (rango ?valor1 ?valor2)
				(acciones $?acciones))
	?celda2 <- (celda (caja ?caja) (rango ?valor1 ?valor2)
				(acciones $?acciones))
	(test (neq ?celda1 ?celda2))
	?celda3 <- (celda (caja ?caja) (rango $?principio ?valor1|?valor2 $?final))
    (test (and (neq ?celda1 ?celda3) (neq ?celda2 ?celda3)))
=>
	(modify ?celda3 (rango ?principio ?final)
		(acciones ?acciones (create$ par-asignado-fila ?celda3 ?valor1 ?valor2)))
	)


;;;----------------------------------------------------------------------------
;;; 3) Estrategia del valor oculto 
;;;----------------------------------------------------------------------------

;;; Si una celda tiene un posible valor en su rango, el rango tiene más de un
;;; valor, y no hay ninguna otra celda distinta en la misma fila, columna o
;;; caja que tenga dicho valor en su rango, entonces se puede asignar dicho
;;; valor a la celda inicial.

;;; Implementa la estrategia del valor oculto con tres reglas: una por filas
;;; (valor-oculto-fila), otra por columnas (valor-oculto-columna) y una última
;;; por cajas (valor-oculto-caja).

(defrule CP::valor-oculto-fila
	?celda <- (celda (fila ?fila) (columna ?columna1) (rango $? ?valor $?)
				(acciones $?acciones))
	(celda (fila ?fila) (columna ?columna1) (rango ? ? $?))
	(not (celda (fila ?fila) (columna ?columna2&~?columna1) (rango $? ?valor $?)))
=>
	(modify ?celda (rango ?valor)
		(acciones ?acciones (create$ valor-oculto-fila ?celda ?valor)))
	)
	
(defrule CP::valor-oculto-columna
	?celda <- (celda (fila ?fila1) (columna ?columna) (rango $? ?valor $?)
				(acciones $?acciones))
	(celda (fila ?fila1) (columna ?columna) (rango ? ? $?))
	(not (celda (fila ?fila2&~?fila1) (columna ?columna) (rango $? ?valor $?)))
=>
	(modify ?celda (rango ?valor)
		(acciones ?acciones (create$ valor-oculto-columna ?celda ?valor)))
	)
	
(defrule CP::valor-oculto-caja
	?celda <- (celda (fila ?fila1) (columna ?columna1) (caja ?caja) (rango $? ?valor $?)
				(acciones $?acciones))
	(celda (fila ?fila1) (columna ?columna1) (rango ? ? $?))
	(not (celda (fila ?fila2) (columna ?columna2&:(or (!= ?fila1 ?fila2) (!= ?columna1 ?columna2)))
			(caja ?caja) (rango $? ?valor $?)))
=>
	(modify ?celda (rango ?valor)
		(acciones ?acciones (create$ valor-oculto-caja ?celda ?valor)))
	)

;;;----------------------------------------------------------------------------
;;; 4) Estrategia de los pares ocultos 
;;;----------------------------------------------------------------------------

;;; Si dos celdas C1 y C2 de la misma unidad (fila, columna o caja) tienen
;;; dos posibles valores en su rango, el rango tiene más elementos, y no hay
;;; ninguna otra celda distinta en la misma unidad con dichos valores en su
;;; rango, entonces se puede eliminar cualquier otro valor del rango de las
;;; celdas C1 y C2.

;;; Implementa la estrategia de los pares ocultos con tres reglas: una por
;;; filas (par-oculto-fila), otra por columnas (par-oculto-columna) y una
;;; última por cajas (par-oculto-caja).

(defrule CP::par-oculto-fila
	?celda1 <- (celda (fila ?fila) (columna ?columna1) (rango $? ?valor1 $? ?valor2 $?)
				(acciones $?acciones))
	?celda2 <- (celda (fila ?fila) (columna ?columna2) (rango $? ?valor1 $? ?valor2 $?)
				(acciones $?acciones))
	(test (neq ?celda1 ?celda2))
	(celda (fila ?fila) (columna ?columna1) (rango ? ? ? $?))
	(celda (fila ?fila) (columna ?columna2) (rango ? ? ? $?))
	(not (celda (fila ?fila) (columna ?columna3&:(and (neq ?columna3 ?columna1) (neq ?columna3 ?columna2)))
			(rango $? ?valor1|?valor2 $?)))
=>
	(modify ?celda1 (rango ?valor1 ?valor2)
		(acciones ?acciones (create$ par-oculto-fila ?celda1 ?valor1 ?valor2)))
	(modify ?celda2 (rango ?valor1 ?valor2)
		(acciones ?acciones (create$ par-oculto-fila ?celda2 ?valor1 ?valor2)))
	)
	
(defrule CP::par-oculto-columna
	?celda1 <- (celda (fila ?fila1) (columna ?columna) (rango $? ?valor1 $? ?valor2 $?)
				(acciones $?acciones))
	?celda2 <- (celda (fila ?fila2) (columna ?columna) (rango $? ?valor1 $? ?valor2 $?)
				(acciones $?acciones))
	(test (neq ?celda1 ?celda2))
	(celda (fila ?fila1) (columna ?columna) (rango ? ? ? $?))
	(celda (fila ?fila2) (columna ?columna) (rango ? ? ? $?))
	(not (celda (fila ?fila3&:(and (neq ?fila3 ?fila1) (neq ?fila3 ?fila2))) (columna ?columna)
			(rango $? ?valor1|?valor2 $?)))
=>
	(modify ?celda1 (rango ?valor1 ?valor2)
		(acciones ?acciones (create$ par-oculto-columna ?celda1 ?valor1 ?valor2)))
	(modify ?celda2 (rango ?valor1 ?valor2)
		(acciones ?acciones (create$ par-oculto-columna ?celda2 ?valor1 ?valor2)))
	)
	
(defrule CP::par-oculto-caja
	?celda1 <- (celda (fila ?fila1) (columna ?columna1) (caja ?caja) (rango $? ?valor1 $? ?valor2 $?)
				(acciones $?acciones))
	?celda2 <- (celda (fila ?fila2) (columna ?columna2) (caja ?caja) (rango $? ?valor1 $? ?valor2 $?) 
				(acciones $?acciones))
	(test (neq ?celda1 ?celda2))
	(celda (fila ?fila1) (columna ?columna1) (rango ? ? ? $?))
	(celda (fila ?fila2) (columna ?columna2) (rango ? ? ? $?))
	(not (celda (fila ?fila3) (columna ?columna3&:(and (or (!= ?fila1 ?fila3) (!= ?columna1 ?columna3)) 
			(or (!= ?fila2 ?fila3) (!= ?columna2 ?columna3)))) (rango $? ?valor1|?valor2 $?)))
=>
	(modify ?celda1 (rango ?valor1 ?valor2)
		(acciones ?acciones (create$ par-oculto-caja ?celda1 ?valor1 ?valor2)))
	(modify ?celda2 (rango ?valor1 ?valor2)
		(acciones ?acciones (create$ par-oculto-caja ?celda2 ?valor1 ?valor2)))
	)
	
;;;----------------------------------------------------------------------------
;;; 5) Estrategia de la intersección fila-caja/columna-caja
;;;----------------------------------------------------------------------------

;; Consideremos una unidad U1 (fila o columna) y una caja U2 con tres celdas
;; en común, C1, C2 y C3. Si un valor no aparece en el rango de ninguna celda
;; de la unidad U1 (respectivamente U2) distinta de C1, C2 y C3, entonces
;; dicho valor se puede eliminar del rango de cualquier celda de la unidad U2
;; (respectivamente U1) distinta de C1, C2 y C3.

;; Implementa la estrategia de la intersección con cuatro reglas, una para
;; cada combinación posible: interseccion-fila-caja, interseccion-caja-fila,
;; interseccion-columna-caja e interseccion-caja-columna.

(defrule CP::interseccion-fila-caja
	?celda1 <- (celda (fila ?fila) (caja ?caja) (rango $? ?valor $?)
				(acciones $?acciones))
	(not (celda (fila ?fila1&~?fila) (caja ?caja1&~?caja) (rango $? ?valor $?)))
	?celda2 <- (celda (fila ?fila2&~?fila) (caja ?caja) (rango $?principio ?valor ?final)
				(acciones $?acciones))
=>
	(modify ?celda2 (rango ?principio ?final)
		(acciones ?acciones (create$ interseccion-fila-caja ?celda2 ?valor)))
	)

(defrule CP::interseccion-caja-fila
	?celda1 <- (celda (fila ?fila) (caja ?caja) (rango $? ?valor $?)
				(acciones $?acciones))
	(not (celda (fila ?fila1&~?fila) (caja ?caja) (rango $? ?valor $?)))
	?celda2 <- (celda (fila ?fila) (caja ?caja1&~?caja) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda2 (rango ?principio ?final)
		(acciones ?acciones (create$ interseccion-caja-fila ?celda2 ?valor)))
	)

(defrule CP::interseccion-columna-caja
	?celda1 <- (celda (columna ?columna) (caja ?caja) (rango $? ?valor $?)
				(acciones $?acciones))
	(not (celda (columna ?columna) (caja ?caja1&~?caja) (rango $? ?valor $?)))
	?celda2 <- (celda (columna ?columna2&~?columna) (caja ?caja) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda2 (rango ?principio ?final)
		(acciones ?acciones (create$ interseccion-columna-caja ?celda2 ?valor)))
	)

(defrule CP::interseccion-caja-columna
	?celda1 <- (celda (columna ?columna) (caja ?caja) (rango $? ?valor $?)
				(acciones $?acciones))
	(not (celda (columna ?columna1&~?columna) (caja ?caja) (rango $? ?valor $?)))
	?celda2 <- (celda (columna ?columna) (caja ?caja1&~?caja) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda2 (rango ?principio ?final)
		(acciones ?acciones (create$ interseccion caja-columna ?celda2 ?valor)))
	)

;;;----------------------------------------------------------------------------
;;; 6) Estrategia de la cruz
;;;----------------------------------------------------------------------------


;;; Dadas cuatro celdas C1, C2, C3 y C4 tales que C1 y C2 están en la unidad
;;; U12 (por ejemplo fila), C3 y C4 están en una unidad U34 del mismo tipo que
;;; el anterior pero distinta, C1 y C3 están una unidad de otro tipo U13 (por
;;; ejemplo columna) y C2 y C4 están en una unidad U24 del mismo tipo que el
;;; anterior pero distinta. Si en el rango de las cuatro celdas hay un mismo
;;; valor que no aparece en ninguna otra celda de las unidades U12 ni U34
;;; (respectivamente U13 ni U24), entonces dicho valor se puede eliminar del
;;; rango de cualquier celda de las unidades U13 y U24 (respectivamente U12 y
;;; U34) distinta de C1, C2, C3 y C4.

;;; En http://www.sudoku.org.uk/SolvingTechniques/X-WingFamily.asp y
;;; http://www.sudokumania.com.ar/metodos/ se puede encontrar una descripción 
;;; más detallada de esta situación y ejemplos.

;;; Implementa la estrategia de la cruz con las reglas que sean necesarias
;;; para tener en cuenta todos los casos posibles: cruz-fila-columna,
;;; cruz-fila-caja, cruz-columna-fila, cruz-columna-caja, cruz-caja-fila y
;;; cruz-caja-columna. OJO. Utilizar todos, puede ralentizar la ejecución.

(defrule CP::cruz-fila-columna
	(celda (fila ?fila1) (columna ?columna1) (rango $? ?valor $?))
	(celda (fila ?fila1) (columna ?columna2&~?columna1) (rango $? ?valor $?))
	(celda (fila ?fila2&~?fila1) (columna ?columna1) (rango $? ?valor $?))
	(celda (fila ?fila2) (columna ?columna2) (rango $? ?valor $?))
	(not (celda (fila ?fila3&~?fila1&~?fila2) (columna ?columna1) (rango $? ?valor $?)))
	(not (celda (fila ?fila3&~?fila1&~?fila2) (columna ?columna2) (rango $? ?valor $?)))
	?celda <- (celda (fila ?fila1|?fila2) (columna ?columna3&~?columna1&~?columna2) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda (rango ?principio ?final)
		(acciones ?acciones (create$ cruz-fila-columna ?celda ?valor)))
	)

(defrule CP::cruz-fila-caja
	(celda (fila ?fila1) (caja ?caja1) (rango $? ?valor $?))
	(celda (fila ?fila1) (caja ?caja2&~?caja1) (rango $? ?valor $?))
	(celda (fila ?fila2&~?fila1) (caja ?caja1) (rango $? ?valor $?))
	(celda (fila ?fila2) (caja ?caja2) (rango $? ?valor $?))
	(not (celda (fila ?fila3&~?fila1&~?fila2) (caja ?caja1) (rango $? ?valor $?)))
	(not (celda (fila ?fila3&~?fila1&~?fila2) (caja ?caja2) (rango $? ?valor $?)))
	?celda <- (celda (fila ?fila1|?fila2) (caja ?caja3&~?caja1&~?caja2) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda (rango ?principio ?final)
		(acciones ?acciones (create$ cruz-fila-caja ?celda ?valor)))
	)

(defrule CP::cruz-columna-caja
	(celda (columna ?columna1) (caja ?caja1) (rango $? ?valor $?))
	(celda (columna ?columna1) (caja ?caja2&~?caja1) (rango $? ?valor $?))
	(celda (columna ?columna2&~?columna1) (caja ?caja1) (rango $? ?valor $?))
	(celda (columna ?columna2) (caja ?caja2) (rango $? ?valor $?))
	(not (celda (columna ?columna3&~?columna1&~?columna2) (caja ?caja1) (rango $? ?valor $?)))
	(not (celda (columna ?columna3&~?columna1&~?columna2) (caja ?caja2) (rango $? ?valor $?)))
	?celda <- (celda (columna ?columna1|?columna2) (caja ?caja3&~?caja1&~?caja2) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda (rango ?principio ?final)
		(acciones ?acciones (create$ cruz-columna-caja ?celda ?valor)))
	)

(defrule cruz-columna-fila
	(celda (fila ?fila1) (columna ?columna1) (rango $? ?valor $?))
	(celda (fila ?fila1) (columna ?columna2&~?columna1) (rango $? ?valor $?))
	(celda (fila ?fila2&~?fila1) (columna ?columna1) (rango $? ?valor $?))
	(celda (fila ?fila2) (columna ?columna2) (rango $? ?valor $?))
	(not (celda (fila ?fila1) (columna ?columna3&~?columna1&~?columna2) (rango $? ?valor $?)))
	(not (celda (fila ?fila2) (columna ?columna3&~?columna1&~?columna2) (rango $? ?valor $?)))
	?celda <- (celda (fila ?fila3&~?fila1&~?fila2) (columna ?columna1|?columna2) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda (rango ?principio ?final)
		(acciones ?acciones (create$ cruz-columna-fila ?celda ?valor)))
	)

(defrule CP::cruz-caja-fila
	(celda (fila ?fila1) (caja ?caja1) (rango $? ?valor $?))
	(celda (fila ?fila1) (caja ?caja2&~?caja1) (rango $? ?valor $?))
	(celda (fila ?fila2&~?fila1) (caja ?caja1) (rango $? ?valor $?))
	(celda (fila ?fila2) (caja ?caja2) (rango $? ?valor $?))
	(not (celda (fila ?fila1) (caja ?caja3&~?caja1&~?caja2) (rango $? ?valor $?)))
	(not (celda (fila ?fila2) (caja ?caja3&~?caja1&~?caja2) (rango $? ?valor $?)))
	?celda <- (celda (fila ?fila3&~?fila1&~?fila2) (caja ?caja1|?caja2) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda (rango ?principio ?final)
		(acciones ?acciones (create$ cruz-caja-fila ?celda ?valor)))
	)

(defrule CP::cruz-caja-columna
	(celda (columna ?columna1) (caja ?caja1) (rango $? ?valor $?))
	(celda (columna ?columna1) (caja ?caja2&~?caja1) (rango $? ?valor $?))
	(celda (columna ?columna2&~?columna1) (caja ?caja1) (rango $? ?valor $?))
	(celda (columna ?caja2) (caja ?caja2) (rango $? ?valor $?))
	(not (celda (columna ?caja1) (caja ?caja3&~?caja1&~?caja2) (rango $? ?valor $?)))
	(not (celda (columna ?columna2) (caja ?caja3&~?caja1&~?caja2) (rango $? ?valor $?)))
	?celda <- (celda (columna ?columna3&~?columna1&~?columna2) (caja ?caja1|?caja2) (rango $?principio ?valor $?final)
				(acciones $?acciones))
=>
	(modify ?celda (rango $?principio $?final)
		(acciones ?acciones (create$ cruz-caja-columna ?celda ?valor)))
	)

;;;============================================================================
;;; MODULO SOLUCION
;;;============================================================================
;;; definimos el modulo solucion. Detecta que nodo es un nodo solución.
(defmodule SOLUCION
   (import MAIN deftemplate nodo)
   (import MAIN deftemplate celda)
   (import MAIN deftemplate print))  
    
    ;;miramos si hemos encontrado la solucion
    (defrule SOLUCION::encuentra-solucion
      (declare (auto-focus TRUE))
      ?nodo <- (nodo (estado) (camino $?camino)(clase cerrado))
      (celda)
      =>
      (modify ?nodo (clase solucion))
     ; (print "SOLUCION ENCONTRADA" ?camino crlf)
      )
   
           
  (defrule SOLUCION::traspasa-celda
      ?celda <- (celda (id ?id)(acciones $?acciones) (rango $?rango&:(> (length$ ?rango) 1))) 
      ?nodo <- (nodo (estado) (camino $?p ?id ?valor $?f) (clase solucion))
      =>
      (modify ?nodo (camino  ?p ?f))
      (modify ?celda (rango ?valor) (acciones ?acciones (create$ busqueda ?valor))))
  
   
  (defrule SOLUCION::imprime
    (not (celda (id ?id)(rango $?rango&:(> (length$ ?rango) 1)))) 
     =>
    (assert (print (estado final)))
    (focus IMPRIME))
      
;;;============================================================================
;;; MODULO IMPRIME
;;;============================================================================

;;; Las siguientes reglas permiten visualizar el estado del sudoku, una vez
;;; aplicadas todas las reglas que implementan las estrategias de resolución:

(defmodule IMPRIME
   (import MAIN  deftemplate celda print))

(defrule IMPRIME::imprime-inicial
  ;(declare (auto-focus TRUE))
  ?print <- (print (estado inicial))
  (celda)
  =>  
  (retract ?print)
  (printout t "Estado inicial" crlf)
  (printout t "+---+---+---+" crlf "|")
  (assert (imprime 1 1)))
 
(defrule IMPRIME::imprime-solucion
  (declare (auto-focus TRUE))
  ?print <- (print (estado final))
  =>  
  (retract ?print)
  (printout t "Estado final" crlf)
  (printout t "+---+---+---+" crlf "|")
  (assert (imprime 1 1)))

(defrule IMPRIME::imprime-celda
  ?h <- (imprime ?i ?j)
  (celda (fila ?i) (columna ?j) (rango $?v))
  =>  (retract ?h)
  (if (= (length$ $?v) 1)
      then (printout t (nth$ 1 $?v))
    else (printout t " "))
  (if (= (mod ?j 3) 0)
      then (printout t "|"))
  (if (= (mod ?j 9) 0)
      then (printout t crlf))
  (if (and (= (mod ?i 3) 0) (= (mod ?j 9) 0))
      then (printout t "+---+---+---+" crlf))
  (if (and (= (mod ?j 9) 0) (not (= ?i 9)))
      then (printout t "|")
    (assert (imprime (+ ?i 1) 1))
    else (assert (imprime ?i (+ ?j 1)))))

 ;;;============================================================================
 ;;; PRUEBO Progagación de restricciones
 ;;; FUNCIONES DE PRUEBA Y TEST
 ;;;============================================================================


 (deffunction MAIN::test ()
    (reset)
    (genera-sudoku-from-cadena "003020600900305001001806400008102900700000008006708200002609500800203009005010300")
    (assert (print (estado inicial)))
    (focus IMPRIME)
    (run)
 )
 
;; defmethod es la forma de definir funciones genéricas en CLIPS. 
(defmethod MAIN::resuelve (?cadena)
    (set-strategy lex)
    (reset)
    (MAIN::genera-sudoku-from-cadena ?cadena)
    (assert (print (estado inicial)))
    (focus NODO_INICIAL)
    (focus CP)
    (focus IMPRIME)
    (run)
 )
 
 ;;; Ejecuta ?num veces run. Util para depurar. 
 ;;; Al principio puede serte util comentar la regla 
 ;;; MAIN::pasa-el-mejor-a-cerrado para ver como funcionan 
 ;;; tus reglas en el mmódulo CP.

 (defmethod MAIN::resuelve (?cadena ?num)
    (set-strategy lex)
    (reset)
    (genera-sudoku-from-cadena ?cadena)
    (assert (print (estado inicial)))
    (focus NODO_INICIAL)
    (focus CP)
    (focus IMPRIME)
    (run ?num)
 )

(deffunction MAIN::resuelve-sudokus (?fichero)
	(open ?fichero  fichero "r")
	(bind ?cadena (readline fichero))
  	(while  (neq ?cadena EOF)
  	  		(printout t ?cadena crlf)
  	  		(resuelve ?cadena)
  			(bind ?cadena (readline fichero))
  	)
  	(close fichero)
 )
 
 
 ; (resuelve-sudokus "easy50.txt")
 
 ; (resuelve "043080250600000000000001094900004070000608000010200003820500000000000005034090710")
 ; (resuelve " 043080250600000000000001094900004070000608000010200003820500000000000005034090710)
 ; (resuelve " 300200000000107000706030500070009080900020004010800050009040301000702000000008006)
 ; (resuelve "380000000000400785009020300060090000800302009000040070001070500495006000000000092")
 ; (resuelve "48.3............71.2.......7.5....6....2..8.............1.76...3.....4......5....") 
 
