class Test1{
    public static void main(String[] a){
	System.out.println(new N().foo());
    }
}

class N{
    boolean[] arr; // Error
    public int foo(){
	return 0;
    }
}
