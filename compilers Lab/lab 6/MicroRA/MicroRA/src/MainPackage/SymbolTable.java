package MainPackage;

import java.util.HashMap;
import java.util.Set;

public class SymbolTable {

	public static HashMap<ControlFlowNode, Integer> nodeToVertex = new HashMap<ControlFlowNode, Integer>();
	public static HashMap<Integer, ControlFlowNode> vertexToNode = new HashMap<Integer, ControlFlowNode>();

	public void insert(ControlFlowNode N, Integer I) {
		nodeToVertex.put(N, I);
		vertexToNode.put(I, N);
	}

	public int getVertexFromNode(ControlFlowNode N) {
		if (nodeToVertex.containsKey(N))
			return nodeToVertex.get(N);

		return -1; // -1 indicates that the vertex is not present
	}

	public ControlFlowNode getNodeFromVertex(Integer I) {
		if (vertexToNode.containsKey(I))
			return vertexToNode.get(I);

		return null;
	}

	// Connects the edges between jump statements
	public static void connectLabels() {
		Set<java.util.Map.Entry<ControlFlowNode, Integer>> i1 = nodeToVertex
				.entrySet();
		Set<java.util.Map.Entry<ControlFlowNode, Integer>> i2 = nodeToVertex
				.entrySet();

		for (java.util.Map.Entry<ControlFlowNode, Integer> i : i1) {
			if (!i.getKey().toLabel.equals("")) {
				String lab = i.getKey().toLabel;
				for (java.util.Map.Entry<ControlFlowNode, Integer> j : i2) {
					if (j.getKey().currentLabel.equals(lab)) {
						// i.getKey().succ.add(j.getValue());
						j.getKey().pre.add(i.getValue());
					}
				}
			}
		}
	}

	public static void getSuccessors() {
		Set<java.util.Map.Entry<ControlFlowNode, Integer>> i1 = nodeToVertex
				.entrySet();
		Set<java.util.Map.Entry<ControlFlowNode, Integer>> i2 = nodeToVertex
				.entrySet();

		for (java.util.Map.Entry<ControlFlowNode, Integer> i : i1) {
			for (Integer succ : i.getKey().pre) {
				for (java.util.Map.Entry<ControlFlowNode, Integer> j : i2) {
					if (j.getValue().equals(succ))
						j.getKey().succ.add(i.getValue());
				}
			}

		}

	}
}