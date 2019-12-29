class Pretvorba {
  String jed = "";


  Pretvorba(String jed_) {
    this.jed = jed_;
  }

  String znak() {
    String z = "";

    for (int i = 0; i< jed.length(); i++) {
      if (jed.charAt(i) == '<' && jed.charAt(i+1) == ' ') {
        z = "<";
      } else if (jed.charAt(i) == '>' && jed.charAt(i+1) == ' ') {
        z = ">";
      } else if (jed.charAt(i) == '<' && jed.charAt(i+1) == '=') {
        z = "<=";
      } else if (jed.charAt(i) == '>' && jed.charAt(i+1) == '=') {
        z = ">=";
      }
    }
    return z;
  }


  float a() {
    float a = 0;

    String aString = ("" +jed.subSequence(jed.indexOf(znak())+2, jed.indexOf("x")));
    a = float(aString);

    return a;
  }

  float b() {
    float b = 0;
    int indMinus = -1;
    int indPlus = -1;
    boolean plus = false;
    boolean minus = false;

    String sub;
    sub = "" + jed.subSequence(jed.indexOf("x"), jed.length());
    

    for (int i = 0; i< sub.length(); i++) {
      if (sub.charAt(i) == '-') {
        indMinus = i + jed.indexOf("x");
        plus = false;
        minus = true;
      }
      if (sub.charAt(i) == '+') {
        indPlus = i + jed.indexOf("x");
        plus = true;
        minus = false;
      }
    }

    if (plus) {
      sub = "" + jed.subSequence(indPlus, jed.length());
      b = float(sub);
    } else if (minus) {
      sub = "" + jed.subSequence(indMinus, jed.length());
      b = float(sub);
    }else{
      b = 0;
    }

    return b;
  }

  //---------------------------PARALELNA X------------------------X JEDNADZBA-------

  float xyA() {
    float a = 0;

    String aString = ("" +jed.subSequence(jed.indexOf(znak())+2, jed.length()));
    a = float(aString);

    return a;
  }

  //-------------------------------------SPECIAL FORMULAS ^^^^^^^----------


  String vrstaJednadzbe() {
    
    if (jed.charAt(0) == 'x') {
      return "Xjednadzba";
      
    } else{
      boolean temp = false;
      for (int i = 0; i< jed.length(); i++) {
         if(jed.charAt(i) == 'x'){
           temp = true;
         }       
      }
      
      if(!temp){
        return "paralelnaX";
      }else{
        return "normalna";
      }
      
    }
  }
  
}
