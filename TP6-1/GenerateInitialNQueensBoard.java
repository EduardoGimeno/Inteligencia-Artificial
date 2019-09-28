package aima.gui.demo.search;

import java.util.HashSet;
//import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import aima.core.environment.nqueens.NQueensBoard;
import aima.core.util.datastructure.XYLocation;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */

public class GenerateInitialNQueensBoard {
	
	public static NQueensBoard randomIni() {
		Random r = new Random();
		NQueensBoard board = new NQueensBoard(8);
		
		// Se inserta una reina en cada fila en una columna aleatoria
		for (int i=0; i<8; i++) {
			int th = r.nextInt(8);
			XYLocation q = new XYLocation(i,th);
			board.addQueenAt(q);
		}
		return board;
	}
	
}