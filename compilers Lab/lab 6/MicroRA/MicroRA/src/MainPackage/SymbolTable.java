package MainPackage;

import java.util.HashMap;
import java.util.Set;
import java.util.Vector;

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

	// Gets the successors of all the nodes from the predeccessors of the nodes
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

	public static Vector<String> setDifference(Vector<String> A,
			Vector<String> B) {
		Vector<String> result = new Vector<String>();
		for (String s : A) {
			if (!B.contains(s))
				result.add(s);
		}
		return result;

	}

	public static Vector<String> setUnion(Vector<String> A, Vector<String> B) {
		Vector<String> result = new Vector<String>();
		for (String s : A) {
			result.add(s);
		}
		for (String s : B) {
			if (!result.contains(s))
				result.add(s);
		}
		return result;
	}

	public static boolean noChange() {
		Set<java.util.Map.Entry<ControlFlowNode, Integer>> nodes = nodeToVertex
				.entrySet();
		for (java.util.Map.Entry<ControlFlowNode, Integer> N : nodes) {
			ControlFlowNode n = N.getKey();
			if (!n.liveIn.equals(n.inPrime) && !n.liveOut.equals(n.outPrime))
				return false;
		}
		return true;
	}

	public static void livenessAnalysis() {
		Set<java.util.Map.Entry<ControlFlowNode, Integer>> nodes = nodeToVertex
				.entrySet();

		do {
			for (java.util.Map.Entry<ControlFlowNode, Integer> N : nodes) {

				ControlFlowNode n = N.getKey();
				// in'[n]<-in[n]
				n.inPrime.removeAllElements();
				n.inPrime.addAll(n.liveIn);

				// out'[n]<-out[n]
				n.outPrime.removeAllElements();
				n.outPrime.addAll(n.liveOut);

				// in[n] ← use[n] ∪ (out[n] − def [n]);
				n.liveIn.removeAllElements();
				n.liveIn.addAll(setUnion(n.used,
						setDifference(n.liveOut, n.defined)));

				// out[n] ← U(s∈succ[n]) in[s] ;
				n.liveOut.removeAllElements();
				for (Integer I : n.succ) {
					ControlFlowNode successor = vertexToNode.get(I);
					n.liveOut.addAll(setUnion(n.liveOut, successor.liveIn));
				}

			}
		} while (!noChange());
	}
}
