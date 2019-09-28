package aima.core.environment.misionerosycanibales;

import java.util.LinkedHashSet;
import java.util.Set;

import aima.core.agent.Action;
import aima.core.search.framework.ActionsFunction;
import aima.core.search.framework.ResultFunction;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */
public class MisionerosyCanibalesFunctionFactory {
	private static ActionsFunction _actionsFunction = null;
	private static ResultFunction _resultFunction = null;

	public static ActionsFunction getActionsFunction() {
		if (null == _actionsFunction) {
			_actionsFunction = new EPActionsFunction();
		}
		return _actionsFunction;
	}

	public static ResultFunction getResultFunction() {
		if (null == _resultFunction) {
			_resultFunction = new EPResultFunction();
		}
		return _resultFunction;
	}

	private static class EPActionsFunction implements ActionsFunction {
		public Set<Action> actions(Object state) {
			MisionerosyCanibalesBoard board = (MisionerosyCanibalesBoard) state;

			Set<Action> actions = new LinkedHashSet<Action>();

			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Cif)) {
				actions.add(MisionerosyCanibalesBoard.Mover1Cif);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Cfi)) {
				actions.add(MisionerosyCanibalesBoard.Mover1Cfi);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Mif)) {
				actions.add(MisionerosyCanibalesBoard.Mover1Mif);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Mfi)) {
				actions.add(MisionerosyCanibalesBoard.Mover1Mfi);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Cif)) {
				actions.add(MisionerosyCanibalesBoard.Mover2Cif);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Cfi)) {
				actions.add(MisionerosyCanibalesBoard.Mover2Cfi);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Mif)) {
				actions.add(MisionerosyCanibalesBoard.Mover2Mif);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Mfi)) {
				actions.add(MisionerosyCanibalesBoard.Mover2Mfi);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1C1Mif)) {
				actions.add(MisionerosyCanibalesBoard.Mover1C1Mif);
			}
			if (board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1C1Mfi)) {
				actions.add(MisionerosyCanibalesBoard.Mover1C1Mfi);
			}

			return actions;
		}
	}

	private static class EPResultFunction implements ResultFunction {
		public Object result(Object s, Action a) {
			MisionerosyCanibalesBoard board = (MisionerosyCanibalesBoard) s;

			if (MisionerosyCanibalesBoard.Mover1Cif.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Cif)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover1Cif();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover1Cfi.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Cfi)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover1Cfi();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover1Mif.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Mif)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover1Mif();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover1Mfi.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1Mfi)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover1Mfi();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover2Cif.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Cif)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover2Cif();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover2Cfi.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Cfi)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover2Cfi();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover2Mif.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Mif)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover2Mif();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover2Mfi.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover2Mfi)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover2Mfi();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover1C1Mif.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1C1Mif)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover1C1Mif();
				return newBoard;
			}
			else if (MisionerosyCanibalesBoard.Mover1C1Mfi.equals(a)
					&& board.realizarMovimiento(MisionerosyCanibalesBoard.Mover1C1Mfi)) {
				MisionerosyCanibalesBoard newBoard = new MisionerosyCanibalesBoard(board);
				newBoard.mover1C1Mfi();
				return newBoard;
			}

			// The Action is not understood or is a NoOp
			// the result will be the current state.
			return s;
		}
	}
}