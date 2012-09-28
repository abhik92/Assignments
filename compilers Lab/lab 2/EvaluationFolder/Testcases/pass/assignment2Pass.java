#define bar(a, b, max, f1, cond)
{
	if(cond & (f1 < max))
	{
		a = 5;
	}
}

#define somBar(x)
{
	if(true)
	{
		if(false)
		{
			if(true)
			{
			
			}
		}
		
		else
		{
			while(x)
			{
				if(true)
				{
				
				}
			}
		}	
	}
	
}

class assignment2Pass
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
		boolean y;
		y=false;
		x=2;
		arr = new int[num] ;
		bar(x, arr, num, varb, cond);

		somBar(y);
		return x;
	}
}
