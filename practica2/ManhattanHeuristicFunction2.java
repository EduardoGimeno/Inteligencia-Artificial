package aima.core.environment.eightpuzzle;

import aima.core.search.framework.HeuristicFunction;
import aima.core.util.datastructure.XYLocation;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */
public class ManhattanHeuristicFunction2 implements HeuristicFunction {

	public double h(Object state) {
		EightPuzzleBoard board = (EightPuzzleBoard) state;
		int retVal = 0;
		for (int i = 1; i < 9; i++) {
			XYLocation loc = board.getLocationOf(i);
			XYLocation dst = EightPuzzleBoard.goal.getGoalState().getLocationOf(i);
			retVal += evaluateManhattanDistanceOf(i, loc, dst);
		}
		return retVal;

	}

	public int evaluateManhattanDistanceOf(int i, XYLocation loc, XYLocation dst) {
		int retVal = -1;
		int xpos = loc.getXCoOrdinate();
		int ypos = loc.getYCoOrdinate();
		int xdst = dst.getXCoOrdinate();
		int ydst = dst.getYCoOrdinate();
		switch (i) {

		case 1:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;
		case 2:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;
		case 3:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;
		case 4:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;
		case 5:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;
		case 6:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;
		case 7:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;
		case 8:
			retVal = Math.abs(xpos - xdst) + Math.abs(ypos - ydst);
			break;

		}
		return retVal;
	}
}