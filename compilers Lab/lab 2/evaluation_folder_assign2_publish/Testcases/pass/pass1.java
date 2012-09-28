#define A() (1)
#define B() (2)
#define C() (3)
class pass1
{
	public static void main(String[] args)
	{
		System.out.println(new getVal().get(2));
	}
}

class getVal
{
	public int get(int b)
	{
		
		int c;
		int d;
		d=B();
		c=d & b;
		return  c;
		
	}
}
