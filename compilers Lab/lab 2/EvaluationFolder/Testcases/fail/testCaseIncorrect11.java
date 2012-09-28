#define MACROE() (5)
class Test1{
    public static void main(String[] a){
	//the error is here - missing parenthesis
	System.out.println(MACROE()+MACROE(MACROE());
    }
}

class NotUsed{
    int[] arr;
    public int[] GetArray(){
	return arr;
    }
}