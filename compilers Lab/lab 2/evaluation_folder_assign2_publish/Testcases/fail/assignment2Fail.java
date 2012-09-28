#define bar(a, b, f1, cond)
{
	if(a <= b)
	{
		a = c[b];
	}
}

#define somBar()
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
			while(false)
			{
				if(true)
				{
				
				}
			}
		}	
	}
	
}

class assignment2Fail
{
	public static void main(String []args)
	{
		System.out.println(new t1().foo(10, true, 10));
	}
}

class t1
{
	t1 tx;
	
	public int foo(int num, boolean cond, int varb)
	{
		tx.foo(num, varb, cond);
		return true;
	}
}
