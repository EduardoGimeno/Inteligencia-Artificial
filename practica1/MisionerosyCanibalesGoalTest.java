package aima.core.environment.misionerosycanibales;

import aima.core.search.framework.GoalTest;


/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */

public class MisionerosyCanibalesGoalTest implements GoalTest {
	MisionerosyCanibalesBoard goal = new MisionerosyCanibalesBoard(new int[] {0, 0, 2, 3, 3});

	public boolean isGoalState(Object state) {
		MisionerosyCanibalesBoard board = (MisionerosyCanibalesBoard) state;
		return board.equals(goal);
	}
}