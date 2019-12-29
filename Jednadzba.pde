class Jednadzba {
  float a, b, alpha;
  String znak;

  String veceJednako = ">=";
  String manjeJednako = "<=";
  String vece = ">";
  String manje = "<";

  float y = max+2;
  float y1 = -max-2;
  float x, x1;
  int h;
  float nultocka;
  boolean paralelanX;
  boolean xJednadzba;
  
  String vrsta;



  Jednadzba(String znak_, float a_, float b_, int farbica, String vrsta_) {
    znak = znak_;
    a = -a_;
    b = -b_;
    h = farbica;
    alpha = atan(a_);
    vrsta = vrsta_;
    
  }

  void izracunaj() {
    if (vrsta == "Xjednadzba") {
    } else if (!(vrsta == "paralelnaX")) {
      nultocka = -b/a;
      x  = (y - b)  / a;
      x1 = (y1 - b) / a;
    } else {
      nultocka = b;
      x = 2;
      x1 = 3;
    }
  }


  void show() {
//    println(znak);
    float xos  = x*jedDuzina;
    float yos  = y*jedDuzina;
    float x1os = x1*jedDuzina;
    float y1os = y1*jedDuzina;

    stroke(h, 100, 100, 100);
    strokeWeight(5);

    if (vrsta == "Xjednadzba") {
      if (znak.equals("<") || znak.equals(">")) {    
        int dash = height/30;
        int x2 = -height;
        for (int i = 0; i < 2*width; i++) {
          line(-a*jedDuzina-p2, x2, -a*jedDuzina-p2, x2+dash);
          x2+=dash*2;
        }
      } else {
        line(-a*jedDuzina-p2, -height, -a*jedDuzina-p2, height);
      }
    } else if (vrsta == "paralelnaX") {
      if (znak.equals("<") || znak.equals(">")) {    
        int dash = width/30;
        int x2 = -width;
        for (int i = 0; i < 2*width; i++) {
          line(x2, b*jedDuzina, x2+dash, b*jedDuzina);
          x2+=dash*2;
        }
      } else { 
        line(-width, b*jedDuzina, width, b*jedDuzina);
      }
    } else {
      float tx, ty;

      if (xos < x1os) { 
        tx = xos + jedDuzina;
      } else { 
        tx = xos - jedDuzina;
      }
      if (yos < y1os) { 
        ty = yos + jedDuzina;
      } else { 
        ty = yos - jedDuzina;
      }

  
      if (znak.equals("<") || znak.equals(">")) {
        if ((xos < 0 && yos > 0) && (x1os > 0 && y1os < 0)) { //--------------------------1
          float dist = udaljenost(xos, yos, x1os, y1os);
          float angle = atan(tanAlpha(kikac(xos, yos, x1os, y1os), kikac(-10, 0, 10, 0)));
          pushMatrix();
          translate(xos-p2, yos);
          rotate(-angle);
          for (int i = 0; i<dist; i++) {
            line(0, 0, 30, 0);
            translate(60, 0);
          }
          popMatrix();
        } else if ((xos > 0 && yos < 0) && (x1os < 0 && y1os > 0)) { //----------------------2
          float temp;
          //zamjena tocaka X
          temp = xos;
          xos = x1os;
          x1os = temp;
          //zamjena tocaka Y
          temp = yos;
          yos = y1os;
          y1os = temp;

          float dist = udaljenost(xos, yos, x1os, y1os);
          float angle = atan(tanAlpha(kikac(xos, yos, x1os, y1os), kikac(-10, 0, 10, 0)));
          pushMatrix();
          translate(xos-p2, yos);
          rotate(-angle);
          for (int i = 0; i<dist; i++) {
            line(0, 0, 30, 0);
            translate(60, 0);
          }
          popMatrix();
        } else if ((xos > 0 && yos > 0) && (x1os < 0 && y1os < 0)) { //----------------------3
          float dist = udaljenost(xos, yos, x1os, y1os);
          float angle = atan(tanAlpha(kikac(xos, yos, x1os, y1os), kikac(-10, 0, 10, 0)));
          pushMatrix();
          translate(xos-p2, yos);
          rotate(PI - angle);
          for (int i = 0; i<dist; i++) {
            line(0, 0, 30, 0);
            translate(60, 0);
          }
          popMatrix();
        } else if ((xos < 0 && yos < 0) && (x1os > 0 && y1os > 0)) { //----------------------4
          float temp;
          //zamjena tocaka X
          temp = xos;
          xos = x1os;
          x1os = temp;
          //zamjena tocaka Y
          temp = yos;
          yos = y1os;
          y1os = temp;

          float dist = udaljenost(xos, yos, x1os, y1os);
          float angle = atan(tanAlpha(kikac(xos, yos, x1os, y1os), kikac(-10, 0, 10, 0)));
          pushMatrix();
          translate(xos-p2, yos);
          rotate(PI - angle);
          for (int i = 0; i<dist; i++) {
            line(0, 0, 30, 0);
            translate(60, 0);
          }
          popMatrix();
        }
      } else { 
        line(xos-p2, yos, x1os-p2, y1os);
      }
    }
  }

  void povrsina() {
  //println(vrsta);
    if (vrsta == "Xjednadzba") {
      fill(h, 100, 100, 50);
      noStroke();

      if (znak.equals("<=") || znak.equals("<")) {
        rect(-width-p2, -height, width-a*jedDuzina, 2*height);
      } else if (znak.equals(">=") || znak.equals(">")) {
        rect(width-p2, -height, -(width+a*jedDuzina), 2*height);
      }
    } else if (vrsta == "paralelnaX") {
      fill(h, 100, 100, 50);
      noStroke();

      if (znak.equals("<=") || znak.equals("<")) {
        rect(-width-p2, b*jedDuzina, 2*width, height);
      } else if (znak.equals(">=") || znak.equals(">")) {
        rect(-width-p2, b*jedDuzina - height, 2*width, height);
      }
    } else {
      if (znak.equals("<=") || znak.equals("<")) {
        pushMatrix();
        translate(nultocka*jedDuzina-p2, 0);
        if (a*0+0 <= 0) {
          rotate(-alpha);
        } else {
          rotate(-alpha-PI);
        }
        fill(h, 100, 100, 50);
        noStroke();
        rect(-max*jedDuzina*3, 0, max*jedDuzina*5, max*jedDuzina*3);
        popMatrix();
      }

      if (znak.equals(">=") || znak.equals(">")) {
        pushMatrix();
        translate(nultocka*jedDuzina-p2, 0);
        if (a*0+0 >= 0) {
          rotate(-alpha-PI);
        } else {
          rotate(-alpha);
        }
        fill(h, 100, 100, 50);
        noStroke();
        rect(-max*jedDuzina*3, 0, max*jedDuzina*5, max*jedDuzina*3);
        popMatrix();
      }
    }
  }

}

float udaljenost(float x1, float y1, float x2, float y2) {
  return(sqrt(pow((x2-x1), 2)+pow((y2-y1), 2)));
}
float kikac(float x1, float y1, float x2, float y2) {
  return((y2-y1)/(x2-x1));
}
float tanAlpha(float k1, float k2) {
  return((k2-k1)/(1+(k1*k2)));
}
