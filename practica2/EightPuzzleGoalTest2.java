package aima.core.environment.eightpuzzle;

import aima.core.search.framework.GoalTest;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */
public class EightPuzzleGoalTest2 implements GoalTest {
	public static EightPuzzleBoard goal = new EightPuzzleBoard(new int[] { 0, 1, 2, 3, 4, 5,
			6, 7, 8 });

	public boolean isGoalState(Object state) {
		EightPuzzleBoard board = (EightPuzzleBoard) state;
		return board.equals(goal);
	}
	
	public static void setGoalState (Object state) {
		goal = (EightPuzzleBoard) state;
	}
	
	public EightPuzzleBoard getGoalState () {
		return goal;
	}
}