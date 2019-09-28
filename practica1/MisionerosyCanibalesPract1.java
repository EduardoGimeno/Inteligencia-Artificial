package aima.gui.demo.search;

import java.util.List;
import aima.core.agent.Action;
import aima.core.environment.misionerosycanibales.MisionerosyCanibalesBoard;
import aima.core.environment.misionerosycanibales.MisionerosyCanibalesFunctionFactory;
import aima.core.environment.misionerosycanibales.MisionerosyCanibalesGoalTest;
import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.Problem;
import aima.core.search.framework.ResultFunction;
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

public class MisionerosyCanibalesPract1 {
	static MisionerosyCanibalesBoard board = new MisionerosyCanibalesBoard(
			new int[] { 3, 3, 1, 0, 0});;
			
	public static void main(String[] args) {
		// Búsqueda primero en anchura
		System.out.println("Misioneros y canibales BFS-G -->");
		misionerosycanibalesSearch(new BreadthFirstSearch(new GraphSearch()),board);
		System.out.format("%n");
		System.out.println("Misioneros y canibales BFS-T -->");
		misionerosycanibalesSearch(new BreadthFirstSearch(new TreeSearch()),board);
		System.out.format("%n");
		
		// Búsqueda primero en profundidad
		System.out.println("Misioneros y canibales DFS-G -->");
		misionerosycanibalesSearch(new DepthFirstSearch(new GraphSearch()),board);
		System.out.format("%n");
		System.out.println("Misioneros y canibales DFS-T -->");
		// Tiempo de resolución no razonable
		System.out.println("--- (1)");
		// misionerosycanibalesSearch(new DepthFirstSearch(new TreeSearch()),board);
		System.out.format("%n");
		
		// Búsqueda limitada en profundidad
		System.out.println("Misioneros y canibales DLS(11) -->");
		misionerosycanibalesSearch(new DepthLimitedSearch(11),board);
		System.out.format("%n");
		
		// Búsqueda en profundidad iterativa
		System.out.println("Misioneros y canibales IDLS -->");
		misionerosycanibalesSearch(new IterativeDeepeningSearch(),board);
		System.out.format("%n");
		
		// Búsqueda de coste uniforme
		System.out.println("Misioneros y canibales UCS-G -->");
		misionerosycanibalesSearch(new UniformCostSearch(new GraphSearch()),board);
		System.out.format("%n");
		System.out.println("Misioneros y canibales UCS-T -->");
		misionerosycanibalesSearch(new UniformCostSearch(new TreeSearch()),board);
	}
	
	private static void misionerosycanibalesSearch(Search search, MisionerosyCanibalesBoard board) {
		try {
			Problem problem = new Problem(board, MisionerosyCanibalesFunctionFactory
					.getActionsFunction(), MisionerosyCanibalesFunctionFactory
					.getResultFunction(), new MisionerosyCanibalesGoalTest());	
			
			long t1 =System.currentTimeMillis();
			SearchAgent agent = new SearchAgent(problem, search);
			long t2 = System.currentTimeMillis();
			long t = t2 - t1;
			
			String pathCost = agent.getInstrumentation().getProperty("pathCost");
			int expandedNodes;
		
			if (agent.getInstrumentation().getProperty("nodesExpanded")==null) expandedNodes=0;
			else expandedNodes =
					(int)Float.parseFloat(agent.getInstrumentation().getProperty("nodesExpanded"));
			
			System.out.format("pathCost: %s%n", pathCost);
			System.out.format("nodesExpanded: %d%n", expandedNodes);
			System.out.format("Tiempo: %d mls %n", t);
			System.out.println("SOLUCIÓN:");
			System.out.println("GOAL STATE");
			System.out.println("RIBERA-IZQ                  --RIO-- BOTE M M M C C C RIBERA-DCH");
			System.out.println("CAMINO ENCONTRADO");
			executeActions(agent.getActions(), problem);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void executeActions(List<Action> actions, Problem problem) {
		Object initialState = problem.getInitialState();
		ResultFunction resultFunction = problem.getResultFunction();
		
		Object state = initialState;
		System.out.print("              ESTADO INICIAL ");
		System.out.println(state);
		
		for (Action action : actions) {
			System.out.format("%28s",action.toString());
			System.out.print(" ");
			state = resultFunction.result(state, action);
			System.out.println(state);
		}
	}
}