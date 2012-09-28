#define LT(a, b) (a < b)
#define bar(a, b, max, f1, cond)
{
	if(cond & (LT(f1, max)))
	{
		a = b[f1];
	}
}

class assignment3Pass
{
	public static void main(String []args)
	{
		System.out.println(new t1().foo(10, true, 1));
	}
}

class t1
{
	public int foo(int num, boolean cond, int varb)
	{
		int [] arr ;
		int x;
		x=2;
		arr = new int[num] ;
		arr[varb]=6;
		bar(x, arr, num, varb, cond);

		return x;
	}
}
