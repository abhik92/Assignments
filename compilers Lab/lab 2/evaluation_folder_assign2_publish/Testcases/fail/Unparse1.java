#define SUCCESS() (0)

class Test1 {
  public static void main (String [] arg) {
    System.out.println(new Exit().doit());
  }
}

class Exit {
  public static int doit() {
    return SUCCESS();
  }
}
