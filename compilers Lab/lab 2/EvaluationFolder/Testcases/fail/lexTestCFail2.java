class lexTestCFail
{
	public static void main(String []args)
	{
		System.out.println(new t1().foo(10, true, 10));
	}
}

class t1
{
	int a;
	int b;
	t1 tx;
	
	public boolean foo(int num, boolean cond, int varb)
	{
		int c;
		boolean flag;
		boolean flag1;
		boolean flag2;
		int [] d;
		int [] x;
		int [] y;
		
		c=9;
		a=13;
		b=15.9;
		
		c = a + b;
		b = (a* (b+ ( a - b)));

		flag = true & flag1;
		flag1 = ((!(!(!(flag2 & flag1)))));
		
		x = new int[10];
		d = new int[x.length];
		y = new int[x[a++]];
		
		return 0;
	}
}
