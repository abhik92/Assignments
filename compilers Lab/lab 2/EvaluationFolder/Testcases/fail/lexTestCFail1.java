class lexTestCFail1
{
	public static Void main(String []args)
	{
		System.out.print(new t1().foo(10, true, 10));
	}
}

class t1
{
	t1 tx;
	
	public int foo(int num, boolean cond, int varb)
	{
		tx.foo(num, varb, cond);
		return 0;
	}
}
