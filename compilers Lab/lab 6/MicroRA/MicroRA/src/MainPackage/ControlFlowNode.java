package MainPackage;

import java.util.Vector;

public class ControlFlowNode {

	public String typeOfInstruction; // Name of instruction
	public Vector<String> defined; // Temps defined in this node
	public Vector<String> used; // Temps used in this node

	public Vector<Integer> inNodes; // List of basic blocks which enter this
									// node
	public Vector<Integer> outNodes; // List of basic blocks which leave this
										// node

}
