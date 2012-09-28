#define Z() (1+0)
class pass
{
	
	public static void main(String []args)
	{
		System.out.println(new BC().Init());	
		
	}
}

class BC
{
	public int Init()
	{	
		System.out.println(new BC1().init());
		return 0;
	}
}


class BC1
{
	public int init()
	{
		return Z();
	}
}
