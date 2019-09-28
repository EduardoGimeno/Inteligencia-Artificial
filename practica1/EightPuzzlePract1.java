package aima.gui.demo.search;


import aima.core.environment.eightpuzzle.EightPuzzleBoard;
import aima.core.environment.eightpuzzle.EightPuzzleFunctionFactory;
import aima.core.environment.eightpuzzle.EightPuzzleGoalTest;
import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.Problem;
import aima.core.search.framework.Search;
import aima.core.search.framework.SearchAgent;
import aima.core.search.framework.TreeSearch;
import aima.core.search.uninformed.BreadthFirstSearch;
import aima.core.search.uninformed.DepthFirstSearch;
import aima.core.search.uninformed.DepthLimitedSearch;
import aima.core.search.uninformed.IterativeDeepeningSearch;
import aima.core.search.uninformed.UniformCostSearch;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */

public class EightPuzzlePract1 {
	static EightPuzzleBoard boardWithThreeMoveSolution = new EightPuzzleBoard(
			new int[] { 1, 2, 5, 3, 4, 0, 6, 7, 8 });;

	static EightPuzzleBoard random1 = new EightPuzzleBoard(new int[] { 1, 4, 2,
			7, 5, 8, 3, 0, 6 });

	static EightPuzzleBoard extreme = new EightPuzzleBoard(new int[] { 0, 8, 7,
			6, 5, 4, 3, 2, 1 });

	public static void main(String[] args) {
		System.out.println("Problema|Profundidad|    Expand|    Q.Size|     MaxQS|    tiempo");
		
		// Primero en anchura
		System.out.print(" BFS-G-3|");
		eightPuzzleSearch(new BreadthFirstSearch(new GraphSearch()),boardWithThreeMoveSolution);
		System.out.print(" BFS-T-3|");
		eightPuzzleSearch(new BreadthFirstSearch(new TreeSearch()),boardWithThreeMoveSolution);
		System.out.print(" BFS-G-9|");
		eightPuzzleSearch(new BreadthFirstSearch(new GraphSearch()),random1);
		System.out.print(" BFS-T-9|");
		eightPuzzleSearch(new BreadthFirstSearch(new TreeSearch()),random1);
		System.out.print("BFS-G-30|");
		eightPuzzleSearch(new BreadthFirstSearch(new GraphSearch()),extreme);
		System.out.print("BFS-T-30|");
		// Memoria insuficiente
		System.out.println("        ---|       ---|       ---|       ---|       (2)");
		// eightPuzzleSearch(new BreadthFirstSearch(new TreeSearch()),extreme);
		
		// Primero en profundidad
		System.out.print(" DFS-G-3|");
		eightPuzzleSearch(new DepthFirstSearch(new GraphSearch()),boardWithThreeMoveSolution);
		System.out.print(" DFS-T-3|");
		// Tiempo de resolución no razonable
		System.out.println("        ---|       ---|       ---|       ---|       (1)");
		// eightPuzzleSearch(new DepthFirstSearch(new TreeSearch()),boardWithThreeMoveSolution);
		System.out.print(" DFS-G-9|");
		eightPuzzleSearch(new DepthFirstSearch(new GraphSearch()),random1);
		System.out.print(" DFS-T-9|");
		// Tiempo de resolución no razonable
		System.out.println("        ---|       ---|       ---|       ---|       (1)");
		// eightPuzzleSearch(new DepthFirstSearch(new TreeSearch()), random1);
		System.out.print("DFS-G-30|");
		eightPuzzleSearch(new DepthFirstSearch(new GraphSearch()),extreme);
		System.out.print("DFS-T-30|");
		// Tiempo de resolución no razonalbe
		System.out.println("        ---|       ---|       ---|       ---|       (1)");
		// eightPuzzleSearch(new DepthFirstSearch(new TreeSearch()),extreme);
		
		// Limitada en profundidad
		System.out.print(" DLS-9-3|");
		eightPuzzleSearch(new DepthLimitedSearch(9),boardWithThreeMoveSolution);
		System.out.print(" DLS-3-3|");
		eightPuzzleSearch(new DepthLimitedSearch(3),boardWithThreeMoveSolution);
		System.out.print(" DLS-9-9|");
		eightPuzzleSearch(new DepthLimitedSearch(9),random1);
		System.out.print(" DLS-3-9|");
		eightPuzzleSearch(new DepthLimitedSearch(3),random1);
		System.out.print("DLS-9-30|");
		eightPuzzleSearch(new DepthLimitedSearch(9),extreme);
		System.out.print("DLS-3-30|");
		eightPuzzleSearch(new DepthLimitedSearch(3),extreme);
		
		// Profundidad iterativa
		System.out.print("   IDS-3|");
		eightPuzzleSearch(new IterativeDeepeningSearch(),boardWithThreeMoveSolution);
		System.out.print("   IDS-9|");
		eightPuzzleSearch(new IterativeDeepeningSearch(),random1);
		System.out.print("  IDS-30|");
		// Tiempo de resolución no razonable
		System.out.println("        ---|       ---|       ---|       ---|       (1)");
		// eightPuzzleSearch(new IterativeDeepeningSearch(),extreme);
		
		// Coste uniforme
		System.out.print(" UCS-G-3|");
		eightPuzzleSearch(new UniformCostSearch(new GraphSearch()),boardWithThreeMoveSolution);
		System.out.print(" UCS-T-3|");
		eightPuzzleSearch(new UniformCostSearch(new TreeSearch()),boardWithThreeMoveSolution);
		System.out.print(" UCS-G-9|");
		eightPuzzleSearch(new UniformCostSearch(new GraphSearch()),random1);
		System.out.print(" UCS-T-9|");
		eightPuzzleSearch(new UniformCostSearch(new TreeSearch()),random1);
		System.out.print("UCS-G-30|");
		eightPuzzleSearch(new UniformCostSearch(new GraphSearch()),extreme);
		System.out.print("UCS-T-30|");
		// Tiempo de resolución no razonable
		System.out.println("        ---|       ---|       ---|       ---|       (1)");
		// eightPuzzleSearch(new UniformCostSearch(new TreeSearch()),extreme);
	}

	private static void eightPuzzleSearch(Search search, EightPuzzleBoard board) {
		try {
			Problem problem = new Problem(board, EightPuzzleFunctionFactory
					.getActionsFunction(), EightPuzzleFunctionFactory
					.getResultFunction(), new EightPuzzleGoalTest());
			
			long t1 =System.currentTimeMillis();
			SearchAgent agent = new SearchAgent(problem, search);
			long t2 = System.currentTimeMillis();
			long t = t2 - t1;
			
			String pathcostM = agent.getInstrumentation().getProperty("pathCost");
			int depth, expandedNodes, maxQueueSize, queueSize;
			if (pathcostM!=null) depth = (int)Float.parseFloat(pathcostM);
			else depth = 0;
			
			if (agent.getInstrumentation().getProperty("nodesExpanded")==null) expandedNodes=0;
			else expandedNodes =
					(int)Float.parseFloat(agent.getInstrumentation().getProperty("nodesExpanded"));
			
			if (agent.getInstrumentation().getProperty("queueSize")==null) queueSize=0;
			else queueSize = (int)Float.parseFloat(agent.getInstrumentation().getProperty("queueSize"));
			
			if (agent.getInstrumentation().getProperty("maxQueueSize")==null) maxQueueSize = 0;
			else maxQueueSize = 
					(int)Float.parseFloat(agent.getInstrumentation().getProperty("maxQueueSize"));
			
			System.out.format("% 11d" + "|", depth);
			System.out.format("% 10d"+ "|", expandedNodes);
			System.out.format("% 10d" + "|", queueSize);
			System.out.format("% 10d" + "|", maxQueueSize);
			System.out.format("% 10d" + "%n", t);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}