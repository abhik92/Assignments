#define ZERO() (0)
#define ONE(x) (x + 1)
#define TEN(x) (10 * x)
class testCaseCorrect12{
    public static void main(String[] a){
        System.out.println(new A().search(5));
    }
}
class A {
    public int search(int x){
        int i;
	int found;
	int ten;
	i = ONE(ZERO());
	found = ZERO();
	ten = TEN(ONE(0)); 
	while(i<ten){
	    if ((x<i)&(i<x))
		found = 1;
	    i = i+1;
	}
	return found;
    }
}
