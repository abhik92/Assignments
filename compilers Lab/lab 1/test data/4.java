#define NUM (10)
#define ONE (1)
class Factorial{
    public static void main(String[] a){
        System.out.println(new Fac().ComputeFac(NUM));
    }
}

class Fac {
    public int ComputeFac(int num){
        int num_aux ;
        if (num < ONE)
            num_aux = ONE ;
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }
}