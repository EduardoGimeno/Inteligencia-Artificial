package aima.gui.demo.search;

import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import aima.core.agent.Action;
import aima.core.environment.eightpuzzle.EightPuzzleBoard;
import aima.core.environment.eightpuzzle.EightPuzzleFunctionFactory;
import aima.core.environment.eightpuzzle.EightPuzzleGoalTest;
import aima.core.environment.eightpuzzle.EightPuzzleGoalTest2;
import aima.core.environment.eightpuzzle.ManhattanHeuristicFunction2;
import aima.core.environment.eightpuzzle.MisplacedTilleHeuristicFunction2;
import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.Problem;
import aima.core.search.framework.Search;
import aima.core.search.framework.SearchAgent;
import aima.core.search.informed.AStarSearch;
import aima.core.search.informed.GreedyBestFirstSearch;
import aima.core.search.local.SimulatedAnnealingSearch;
import aima.core.search.uninformed.BreadthFirstSearch;
import aima.core.search.uninformed.DepthLimitedSearch;
import aima.core.search.uninformed.IterativeDeepeningSearch;
import aima.core.util.math.Biseccion;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */

public class EightPuzzlePract2 {
	
	public static void main(String args[]) {
		System.out.println("-------------------------------------------------------------------------------------------");
		System.out.println("||    ||       Nodos Generados                  ||                  b*                   ||");
		System.out.println("-------------------------------------------------------------------------------------------");
		System.out.println("||   d||    BFS   |    IDS  | A*h(1)  | A*h(2)  ||    BFS  |    IDS  | A*h(1)  | A*h(2)  ||");
		System.out.println("-------------------------------------------------------------------------------------------");
		System.out.println("-------------------------------------------------------------------------------------------");
		HoundredExperiments();
		System.out.println("-------------------------------------------------------------------------------------------");
	}
	
	private static void HoundredExperiments () {
		try {
			SearchAgent alg[];
			alg = new SearchAgent[4];
			int generatedNodes[];
			generatedNodes = new int[] {0, 0, 0, 0};
			
			for (int i=2; i<=24; ++i) {
				int j = 0;
				while (j <= 99) {
					// Obtención del estado inicial y final
					EightPuzzleBoard initialState = new EightPuzzleBoard(GenerateInitialEightPuzzleBoard.randomIni());
					EightPuzzleBoard finalState = GenerateInitialEightPuzzleBoard.random(i,new EightPuzzleBoard(initialState));
					EightPuzzleGoalTest2.setGoalState(new EightPuzzleBoard(finalState));
					
					// Se comprueba mediante el algoritmo A* que la profundidad del estado final coincide con la deseada
					Problem problem = new Problem(initialState, EightPuzzleFunctionFactory
							.getActionsFunction(), EightPuzzleFunctionFactory
							.getResultFunction(), EightPuzzleBoard.goal);
					
					SearchAgent agent = new SearchAgent(problem, new AStarSearch(new GraphSearch(),new ManhattanHeuristicFunction2()));
					
					String pathcostM = agent.getInstrumentation().getProperty("pathCost");
					int depth;
					if (pathcostM!=null) depth = (int)Float.parseFloat(pathcostM);
					else depth = 0;
					
					if (depth == i) {
						// Búsqueda primero en anchura
						try {
							alg[0] = new SearchAgent(problem, new BreadthFirstSearch(new GraphSearch()));
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						// Búsqueda iterativa en profundidad
						// A partir de la profundidad 13 el tiempo de finalización es demasiado grande, asi que se evita ejecutar
						if (i < 13) {
							try {
								alg[1] = new SearchAgent(problem, new IterativeDeepeningSearch());
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
						
						// A* con herística MisplacedTille
						try {
							alg[2] = new SearchAgent(problem, new AStarSearch(new GraphSearch(),new MisplacedTilleHeuristicFunction2()));
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						// A* con herística Manhattan
						try {
							alg[3] = new SearchAgent(problem, new AStarSearch(new GraphSearch(),new ManhattanHeuristicFunction2()));
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						// Obtención de nodos generados
						for (int k=0; k<4; ++k) {
							// A partir de la profundidad 13 no se obitene IDS
							if (alg[k].getInstrumentation().getProperty("nodesGenerated")==null || (i > 13 && k == 1)) {
								generatedNodes[k] = generatedNodes[k] + 0;
							}
							else {
								generatedNodes[k] = generatedNodes[k] + (int)Float.parseFloat(alg[k].getInstrumentation().getProperty("nodesGenerated"));
							}
						}
						
						j++;
					}
				}
				
				// Mostrar media de nodos generados
				System.out.format("||" + "% 4d" + "||", i);
				System.out.format("% 8d" + "  |", generatedNodes[0]/100);
				// A partir de profundidad 13 no se muestra la búsqueda IDS
				if (i < 13) {
					System.out.format("% 7d" + "  |", generatedNodes[1]/100);
				}
				else {
					System.out.print("    ---  |");
				}
				System.out.format("% 7d" + "  |", generatedNodes[2]/100);
				System.out.format("% 7d" + "  ||", generatedNodes[3]/100);
				
				// Obtención del factor de ramificación
				double factorRamificacion[] = {0.0, 0.0, 0.0, 0.0};
				for (int l=0; l<4; ++l) {
					// A partir de la profundidad 13 no se obtiene IDS
					if ((l != 1 && i > 13) || (i <= 13)) {
						Biseccion bf = new Biseccion();
						bf.setDepth(i);
						bf.setGeneratedNodes(generatedNodes[l]/100);
						factorRamificacion[l] = bf.metodoDeBiseccion(1.00000001,4.0,1E-10);
					}
				}
				
				// Mostrar factor de ramificación
				DecimalFormat df = new DecimalFormat("#.00");
				System.out.format("% 7.2f" + "  |", factorRamificacion[0]);
				// A partir de la profundidad 13 no se muestra la búsqueda IDS
				if (i < 13) {
					System.out.format("% 7.2f" + "  |", factorRamificacion[1]);
				}
				else {
					System.out.print("    ---  |");
				}
				System.out.format("% 7.2f" + "  |", factorRamificacion[2]);
				System.out.format("% 7.2f" + "  ||%n", factorRamificacion[3]);
				
				generatedNodes = new int[] {0, 0, 0, 0};
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}