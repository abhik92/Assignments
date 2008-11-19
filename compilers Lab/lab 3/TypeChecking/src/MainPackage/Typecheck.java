package MainPackage;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import syntaxtree.*;
import visitor.*;

public class Typecheck {
	public static void main(String[] args) throws FileNotFoundException {
		try {
			Node root = new MiniJavaParser(new FileInputStream("testing.java"))
					.Goal();
			System.out.println("Program parsed successfully");
			SymbolTable sym = new SymbolTable();
			root.accept(new GJNoArguDepthFirst(sym));
			System.out.println(sym.mainTable.size());
			if (SymbolTable.needsTransitive) {
				new SymbolTable().findTransitiveClosure();
			}

			root.accept(new GJNoArguDepthFirst_Parse2(sym));
			System.out.println(sym.mainTable.size());
		} catch (ParseException e) {
			System.out.println(e.toString());
		}
	}
}
