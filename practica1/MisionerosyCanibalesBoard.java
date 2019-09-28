package aima.core.environment.misionerosycanibales;

import java.util.Arrays;

import aima.core.agent.Action;
import aima.core.agent.impl.DynamicAction;

/*
 * Autor: Eduardo Gimeno
 * NIA: 721615
 */

public class MisionerosyCanibalesBoard {
	public static Action Mover1Cif = new DynamicAction("Mover1C(i,f)");
	public static Action Mover1Cfi = new DynamicAction("Mover1C(f,i)");
	public static Action Mover1Mif = new DynamicAction("Mover1M(i,f)");
	public static Action Mover1Mfi = new DynamicAction("Mover1M(f,i)");
	public static Action Mover2Cif = new DynamicAction("Mover2C(i,f)");
	public static Action Mover2Cfi = new DynamicAction("Mover2C(f,i)");
	public static Action Mover2Mif = new DynamicAction("Mover2M(i,f)");
	public static Action Mover2Mfi = new DynamicAction("Mover2M(f,i)");
	public static Action Mover1C1Mif = new DynamicAction("Mover1C1M(i,f)");
	public static Action Mover1C1Mfi = new DynamicAction("Mover1C1M(f,i)");
	
	private int[] state;
	
	public MisionerosyCanibalesBoard() {
		state = new int[] {3, 3, 1, 0, 0};
	}
	
	public MisionerosyCanibalesBoard(int[] state) {
		this.state = new int[state.length];
		System.arraycopy(state, 0, this.state, 0, state.length);
	}
	
	public MisionerosyCanibalesBoard(MisionerosyCanibalesBoard copyBoard) {
		this(copyBoard.getState());
	}
	
	public int[] getState() {
		return state;
	}
	
	public void mover1Cif () {
		// ((Mf > Cf) or (Mf = 0)) and (Ci != 0) and (B = i) 
		if (((state[4] > state[3]) || (state[4] == 0)) && (state[0] != 0) && (state[2] == 1)) {
			// Cf = Cf + 1, Ci = Ci - 1, B = f
			state[3] = state[3] + 1;
			state[0] = state[0] - 1;
			state[2] = 2;
		}
	}
	
	public void mover1Cfi () {
		// ((Mi > Ci) or (Mi = 0)) and (Cf != 0) and (B = f) 
		if (((state[1] > state[0]) || (state[1] == 0)) && (state[3] != 0) && (state[2] == 2)) {
			// Ci = Ci + 1, Cf = Cf - 1, B = i
			state[0] = state[0] + 1;
			state[3] = state[3] - 1;
			state[2] = 1;
		}
	}
	
	public void mover1Mif () {
		// (((Mi >= Ci + 1) or (Mi = 1)) && (Mf >= Cf - 1)) && (Mi >= 1) && (B = i)
		if ((((state[1] >= state[0]+1) || (state[1] == 1)) && (state[4] >= state[3]-1)) && (state[1] >= 1) && (state[2] == 1)) {
			// Mf = Mf + 1, Mi = Mi - 1, B = f 
			state[4] = state[4] + 1;
			state[1] = state[1] - 1;
			state[2] = 2;
		}
	}
	
	public void mover1Mfi () {
		// (((Mf >= Cf + 1) or (Mf = 1)) && (Mi >= Ci - 1)) && (Mf >= 1) && (B = f)
		if ((((state[4] >= state[3]+1) || (state[4] == 1)) && (state[1] >= state[0]-1)) && (state[4] >= 1) && (state[2] == 2)) {
			// Mi = Mi + 1, Mf = Mf - 1, B = i 
			state[1] = state[1] + 1;
			state[4] = state[4] - 1;
			state[2] = 1;
		}
	}

	public void mover2Cif () {
		// ((Mf >= Cf + 2) or Mf = 0) && (Ci >= 2) && (B = i)
		if (((state[4] >= state[3]+1) || (state[4] == 0)) && (state[0] >= 2) && (state[2] == 1)) {
			// Cf = Cf + 2, Ci = Ci - 2, B = f
			state[3] = state[3] + 2;
			state[0] = state[0] - 2;
			state[2] = 2;
		}
	}
	
	public void mover2Cfi () {
		// ((Mi >= Ci + 2) or Mi = 0) && (Cf >= 2) && (B = f)
		if (((state[1] >= state[0]+1) || (state[1] == 0)) && (state[3] >= 2) && (state[2] == 2)) {
			// Ci = Ci + 2, Cf = Cf - 2, B = i
			state[0] = state[0] + 2;
			state[3] = state[3] - 2;
			state[2] = 1;
		}
	}
	
	public void mover2Mif () {
		// (((Mi >= Ci + 2) or (Mi = 2)) && (Mf >= Cf -1)) && (Mi >= 2) && (B = i)
		if ((((state[1] >= state[0]+2) || (state[1] == 2)) && (state[4] >= state[3]-2)) && (state[1] >= 2) && (state[2] == 1)) {
			// Mf = Mf + 2, Mi = Mi - 2, B = f
			state[4] = state[4] + 2;
			state[1] = state[1] - 2;
			state[2] = 2;
		}
	}
	
	public void mover2Mfi () {
		// (((Mf >= Cf + 2) or (Mf = 2)) && (Mi >= Ci -1)) && (Mf >= 2) && (B = f)
		if ((((state[4] >= state[3]+2) || (state[4] == 2)) && (state[1] >= state[0]-2)) && (state[4] >= 2) && (state[2] == 2)) {
			// Mi = Mi + 2, Mf = Mf - 2, B = i
			state[1] = state[1] + 2;
			state[4] = state[4] - 2;
			state[2] = 1;
		}
	}
	
	public void mover1C1Mif () {
		// (Mf >= Cf) && (Mi >= 1) && (Ci >= 1) && (B = i)
		if ((state[4] >= state[3]) && (state[1] >= 1) && (state[0] >= 1) && (state[2] == 1)) {
			// Cf = Cf + 1, Ci = Ci - 1, Mf = Mf + 1, Mi = Mi - 1, B = f
			state[3] = state[3] + 1;
			state[0] = state[0] - 1;
			state[4] = state[4] + 1;
			state[1] = state[1] - 1;
			state[2] = 2;
		}
	}
	
	public void mover1C1Mfi () {
		// (Mi >= Ci) && (Mf >= 1) && (Cf >= 1) && (B = f)
		if ((state[1] >= state[0]) && (state[4] >= 1) && (state[3] >= 1) && (state[2] == 2)) {
			// Ci = Ci + 1, Cf = Cf - 1, Mi = Mi + 1, Mf = Mf - 1, B = i
			state[0] = state[0] + 1;
			state[3] = state[3] - 1;
			state[1] = state[1] + 1;
			state[4] = state[4] - 1;
			state[2] = 1;
		}
	}
	
	public boolean realizarMovimiento (Action where) {
		boolean retVal = true;
		if (where.equals(Mover1Cif)) {
			// ((Mf > Cf) or (Mf = 0)) and (Ci != 0) and (B = i) 
			retVal = (((state[4] > state[3]) || (state[4] == 0)) && (state[0] != 0) && (state[2] == 1));
		}
		else if (where.equals(Mover1Cfi)) {
			// ((Mi > Ci) or (Mi = 0)) and (Cf != 0) and (B = f) 
			retVal = (((state[1] > state[0]) || (state[1] == 0)) && (state[3] != 0) && (state[2] == 2));
		}
		else if (where.equals(Mover1Mif)) {
			// (((Mi >= Ci + 1) or (Mi = 1)) && (Mf >= Cf - 1)) && (Mi >= 1) && (B = i)
			retVal = ((((state[1] >= state[0]+1) || (state[1] == 1)) && (state[4] >= state[3]-1)) && (state[1] >= 1) && (state[2] == 1));
		}
		else if (where.equals(Mover1Mfi)) {
			// (((Mf >= Cf + 1) or (Mf = 1)) && (Mi >= Ci - 1)) && (Mf >= 1) && (B = f)
			retVal = ((((state[4] >= state[3]+1) || (state[4] == 1)) && (state[1] >= state[0]-1)) && (state[4] >= 1) && (state[2] == 2));
		}
		else if (where.equals(Mover2Cif)) {
			// ((Mf >= Cf + 2) or Mf = 0) && (Ci >= 2) && (B = i)
			retVal = (((state[4] >= state[3]+1) || (state[4] == 0)) && (state[0] >= 2) && (state[2] == 1));
		}
		else if (where.equals(Mover2Cfi)) {
			// ((Mi >= Ci + 2) or Mi = 0) && (Cf >= 2) && (B = f)
			retVal = (((state[4] >= state[3]+1) || (state[4] == 0)) && (state[0] >= 2) && (state[2] == 1));
		}
		else if (where.equals(Mover2Mif)) {
			// (((Mi >= Ci + 2) or (Mi = 2)) && (Mf >= Cf -1)) && (Mi >= 2) && (B = i)
			retVal = ((((state[1] >= state[0]+2) || (state[1] == 2)) && (state[4] >= state[3]-2)) && (state[1] >= 2) && (state[2] == 1));
		}
		else if (where.equals(Mover2Mfi)) {
			// (((Mf >= Cf + 2) or (Mf = 2)) && (Mi >= Ci -1)) && (Mf >= 2) && (B = f)
			retVal = ((((state[4] >= state[3]+2) || (state[4] == 2)) && (state[1] >= state[0]-2)) && (state[4] >= 2) && (state[2] == 2));
		}
		else if (where.equals(Mover1C1Mif)) {
			// (Mf >= Cf) && (Mi >= 1) && (Ci >= 1) && (B = i)
			retVal = ((state[4] >= state[3]) && (state[1] >= 1) && (state[0] >= 1) && (state[2] == 1));
		}
		else if (where.equals(Mover1C1Mfi)) {
			// (Mi >= Ci) && (Mf >= 1) && (Cf >= 1) && (B = f)
			retVal = ((state[1] >= state[0]) && (state[4] >= 1) && (state[3] >= 1) && (state[2] == 2));
		}
		return retVal;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(state);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MisionerosyCanibalesBoard other = (MisionerosyCanibalesBoard) obj;
		if (!Arrays.equals(state, other.state))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		String retVal = "RIBERA-IZQ ";
		
		if (state[1] == 3) {
			retVal = retVal + "M M M ";
		}
		else if (state[1] == 2) {
			retVal = retVal + "  M M ";
		}
		else if (state[1] == 1) {
			retVal = retVal + "    M ";
		}
		else {
			retVal = retVal + "      ";
		}
		
		if (state[0] == 3) {
			retVal = retVal + "C C C ";
		}
		else if (state[0] == 2) {
			retVal = retVal + "  C C "; 
		}
		else if (state[0] == 1) {
			retVal = retVal + "    C ";
		}
		else {
			retVal = retVal + "      ";
		}
		
		if (state[2] == 1) {
			retVal = retVal + "BOTE ";
		}
		else {
			retVal = retVal + "     ";
		}
		
		retVal = retVal + "--RIO-- ";
		
		if (state[2] == 2) {
			retVal = retVal + "BOTE ";
		}
		else {
			retVal = retVal + "     ";
		}
		
		if (state[4] == 3) {
			retVal = retVal + "M M M ";
		}
		else if (state[4] == 2) {
			retVal = retVal + "  M M ";
		}
		else if (state[4] == 1) {
			retVal = retVal + "    M ";
		}
		else {
			retVal = retVal + "      ";
		}
		
		if (state[3] == 3) {
			retVal = retVal + "C C C ";
		}
		else if (state[3] == 2) {
			retVal = retVal + "  C C "; 
		}
		else if (state[3] == 1) {
			retVal = retVal + "    C ";
		}
		else {
			retVal = retVal + "      ";
		}
		
		retVal = retVal + "RIBERA-DCH";
		
		return retVal;
	}
}