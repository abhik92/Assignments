/*
 * Author : Karthik Abinav
 * Roll Number : CS10B057
 * References: Liveness Analysis , Linear Scan Algorithm (Class Slides,Wikipedia) 
 */

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Set;
import java.util.Vector;

import MainPackage.AliasTable;
import MainPackage.ControlFlowNode;
import MainPackage.LiveRange;
import MainPackage.Pair;
import MainPackage.SymbolTable;

import syntaxtree.*;
import visitor.*;

class Main {
	public static void main(String[] args) throws FileNotFoundException {
		try {
			Node root = new microIRParser(new FileInputStream(
					"../../Tests/microIR/Factorial.microIR")).Goal();

			// Node root = new microIRParser(System.in).Goal();
			// root.accept(new ChangeLocalsToGlobal(), null);
			root.accept(new GJNoArguDepthFirst()); // Your assignment part is
			// invoked here.

			SymbolTable.connectLabels();
			SymbolTable.getSuccessors();
			SymbolTable.populateNodes();
			SymbolTable.livenessAnalysis();
			SymbolTable.getLiveRanges();
			SymbolTable.linearScan();
			
			System.out.println("Program parsed successfully");

			for (Pair N : SymbolTable.nodeList) {
				System.out.println(N.second + " " + N.first.liveIn);
			}

			Set<java.util.Map.Entry<String, LiveRange>> e1 = SymbolTable.liveRanges
					.entrySet();

			for (java.util.Map.Entry<String, LiveRange> t : e1) {
				System.out.println(t.getKey() + " " + t.getValue().start + " "
						+ t.getValue().end);
			}

		} catch (ParseException e) {
			System.out.println(e.toString());
		}
	}
}
