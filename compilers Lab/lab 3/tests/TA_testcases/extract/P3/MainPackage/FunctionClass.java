package MainPackage;

import java.util.ArrayList;

public class FunctionClass {
	public String retType;
	public ArrayList<VariableClass> formalParamList;

	public FunctionClass(String retType) {
		this.retType = retType;
		this.formalParamList = new ArrayList<VariableClass>();
	}
}
