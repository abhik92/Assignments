
class lexTextCase2
{
	public static void main(String []args)
	{
		System.out.println((new t1()).foo(10, true, 10)); 
	}
}

class t1
{
	 t1 tx;
	
	public int foo(int num, boolean cond, int varb)
	{
		int y;
		if (0 < num){
			y=this.foo((num-1), cond,varb );
		} 
		return 0;
	}
}
