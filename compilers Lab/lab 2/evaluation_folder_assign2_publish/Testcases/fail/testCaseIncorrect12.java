class Search{
    public static void main(String[] a){
        System.out.println(new A().search(5));
    }
}
class A {
    public int search(int x){
        int i;
	int found ;
	i = 1;
	found = 0;
	while(i<10){
	    if ((x<i)&&(i<x))
		found = 1;
	    //the error is here
	    i += 1;
	}
	return found;
    }
}
