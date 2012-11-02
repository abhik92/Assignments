package MainPackage;

import java.util.Set;

public class Debugger {

	public static void printLiveRanges() {
		System.out.println("Begin -- liveranges --");
		Set<java.util.Map.Entry<String, LiveRange>> e = SymbolTable.liveRanges
				.entrySet();

		for (java.util.Map.Entry<String, LiveRange> t : e) {
			System.out.println(t.getKey() + " " + t.getValue().start + " "
					+ t.getValue().end);
		}

		System.out.println("End -- Live ranges --");
	}

	public static void printLiveRangesSorted() {
		System.out.println("Begin -- liveranges sorted --");
		for (PairLiveRange P : SymbolTable.LinearRange)
			System.out.println(P.first + " " + P.second.start + " "
					+ P.second.end);

		System.out.println("End -- Live ranges sorted --");
	}

	public static void printRegisters() {
		System.out.println("Begin -- register allocation --");
		Set<java.util.Map.Entry<PairLiveRange, String>> e1 = SymbolTable.registers
				.entrySet();

		for (java.util.Map.Entry<PairLiveRange, String> t : e1) {
			System.out.println(t.getKey().first + " " + t.getValue());
		}
		System.out.println("End -- register allocation --");
	}

	public static void printStack() {
		System.out.println("Begin -- stack --");

		Set<java.util.Map.Entry<PairLiveRange, Integer>> e2 = SymbolTable.location
				.entrySet();

		for (java.util.Map.Entry<PairLiveRange, Integer> t : e2) {
			System.out.println(t.getKey().first + " " + t.getValue());
		}
		System.out.println("End -- stack --");
	}

}
