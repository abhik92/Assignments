import java.io.FileInputStream;
import java.io.FileNotFoundException;

import syntaxtree.*;
import visitor.*;
import MainPackage.*;

public class Typecheck
{
	public static void main(String[] args) throws FileNotFoundException
	{
		try
		{
			/*
			 * Node root = new MiniJavaParser(new
			 * FileInputStream("LinearSearch-error.java")) .Goal();
			 */
			Node root = new MiniJavaParser(System.in).Goal();
			SymbolTable sym = new SymbolTable();
			root.accept(new GJNoArguDepthFirst(sym));
			if (SymbolTable.needsTransitive)
			{
				new SymbolTable().findTransitiveClosure();
			}
			root.accept(new GJNoArguDepthFirst_Parse2(sym));
			System.out.print("Program type checked successfully");
		} catch (ParseException e)
		{
            System.out.println(e.toString());
		}
	}
}
