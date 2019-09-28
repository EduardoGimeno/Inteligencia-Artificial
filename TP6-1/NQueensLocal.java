package aima.gui.demo.search;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import aima.core.agent.Action;
import aima.core.environment.nqueens.AttackingPairsHeuristic;
import aima.core.environment.nqueens.NQueensBoard;
import aima.core.environment.nqueens.NQueensFitnessFunction;
import aima.core.environment.nqueens.NQueensFunctionFactory;
import aima.core.environment.nqueens.NQueensGoalTest;
import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.Problem;
import aima.core.search.framework.Search;
import aima.core.search.framework.SearchAgent;
import aima.core.search.framework.TreeSearch;
import aima.core.search.local.GeneticAlgorithm;
import aima.core.search.local.HillClimbingSearch;
import aima.core.search.local.HillClimbingSearch.SearchOutcome;
import aima.core.search.local.Individual;
import aima.core.search.local.SimulatedAnnealingSearch;
import aima.core.search.uninformed.BreadthFirstSearch;
import aima.core.search.uninformed.DepthFirstSearch;
import aima.core.search.uninformed.DepthLimitedSearch;
import aima.core.search.uninformed.IterativeDeepeningSearch;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */

public class NQueensLocal {

	private static final int _boardSize = 8;
	
	public static void main(String[] args) {
		nQueensHillClimbingSearch_Statistics(10000);
		nQueensRandomRestartHillClimbing();
	}
	
	private static void nQueensHillClimbingSearch_Statistics(int numExperiments) {
		System.out.println("NQueens HillClimbing con " + numExperiments + " estados iniciales diferentes -->");
		
		// Array de estados iniciales
		NQueensBoard iniRandBoards[];
		iniRandBoards = new NQueensBoard[numExperiments];
		
		// Estadísticas
		double aciertos = 0, fallos = 0;
		double costeA = 0, costeF = 0;
		
		// Varaibles de control
		int i = 0, j = 0;
		boolean repetido = false;
		
		NQueensGoalTest goal = new NQueensGoalTest();
		
		while (i < numExperiments) {
			// Generar estado incial aleatorio
			NQueensBoard randomIni = GenerateInitialNQueensBoard.randomIni();
			
			// Comprobar si el estado inicial generado está repetido
			j = 0;
			repetido = false;
			while (!repetido && (j < i)) {
				if (iniRandBoards[j].equals(randomIni)) {
					repetido = true;
				}
				j++;
			}
			
			// Si no está repetido, resolver
			if (!repetido) {
				iniRandBoards[i] = randomIni;
				
				try {
					Problem problem = new Problem(randomIni,
							NQueensFunctionFactory.getCActionsFunction(),
							NQueensFunctionFactory.getResultFunction(),
							goal);
					HillClimbingSearch search = new HillClimbingSearch(
							new AttackingPairsHeuristic());
					SearchAgent agent = new SearchAgent(problem, search);
					
					// Actualizar estadísticas
					if (search.getOutcome() == SearchOutcome.SOLUTION_FOUND) {
						aciertos++;
						costeA += agent.getActions().size();
					}
					else {
						fallos++;
						costeF += agent.getActions().size();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				i++;
			}
		}
		
		double prF = (fallos/(numExperiments)*100);
		double prA = (aciertos/(numExperiments)*100);
		
		System.out.println("Fallos: " + new DecimalFormat("#0.00").format(prF));
		System.out.println("Coste medio fallos: " + new DecimalFormat("#0.00").format(costeF/fallos));
		System.out.println("Exitos: " + new DecimalFormat("#0.00").format(prA));
		System.out.println("Coste medio exitos: " + new DecimalFormat("#0.00").format(costeA/aciertos));
		System.out.println();
	}
	
	private static void nQueensRandomRestartHillClimbing() {
		boolean resuelto = false;
		HillClimbingSearch search = new HillClimbingSearch(
				 					new AttackingPairsHeuristic());
		
		// Estadísticas
		double aciertos = 0, fallos = 0, numIntentos = 0;
		double costeA = 0, costeF = 0;
		
		while (!resuelto) {
			// Generar estado incial
			NQueensBoard initial = GenerateInitialNQueensBoard.randomIni();
			
			search = new HillClimbingSearch(
 					 new AttackingPairsHeuristic());
			
			try {
				Problem problem = new Problem(initial,
						NQueensFunctionFactory.getCActionsFunction(),
						NQueensFunctionFactory.getResultFunction(),
						new NQueensGoalTest());
				SearchAgent agent = new SearchAgent(problem, search);
				
				// Actualizar estadísticas
				if (search.getOutcome() == SearchOutcome.SOLUTION_FOUND) {
					resuelto = true;
					costeA += agent.getActions().size();
				}
				else {
					fallos++;
					costeF += agent.getActions().size();
				}
				numIntentos++;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("Search Outcome=" + search.getOutcome());
		System.out.println("Final State=\n" + search.getLastSearchState());
		System.out.println();
		System.out.println("Numero de intentos: " + numIntentos);
		System.out.println("Fallos: " + fallos);
		System.out.println("Coste medio fallos: " + new DecimalFormat("#0.00").format(costeF/fallos));
		System.out.println("Coste Exito: "+ new DecimalFormat("#0.00").format(costeA));
	}
	
}