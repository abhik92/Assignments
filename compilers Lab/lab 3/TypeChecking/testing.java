class Test{
    public static void main(String[] a){
        System.out.println(new A().run(2, new A().manju(), new A().abhiram(new A().manju(),3)));
    }
}
class A {
    int[] a;
    int c;
    public int run(int b, int d, int f){
        c = b;
        return 0;
    }
    public int abhiram(int b, int d)
    {
        return 1;
    }
    public int manju()
    {
        return 4;
    }
}
