class Koordinatni_sustav {

  void jedinicnaDuzina() {
    jedDuzina = int(map(1, 0, max, 0, width/2-25-p2));
  }

  void crtanje() {
   
    stroke(0);
    strokeWeight(1);
    line(0, height/2, width-p2, height/2);
    line(width/2-p2, 0, width/2-p2, height);
    textSize(10);
    fill(0);
    pushMatrix();
    translate(width/2-p2, height/2);
    text("0", -10, 12);
    int skiper;
    if (max > 30) {
      skiper = 10;
    } else if (max > 20) {
      skiper = 3;
    }else if(max > 11){
      skiper = 2;
    } else {
      skiper = 1;
    }
    for (int i = 1; i < max+1; i+=skiper) {
      text(i, i*jedDuzina-2, 16);
      line(i*jedDuzina, -4, i*jedDuzina, 4);
      text(-i, -i*jedDuzina-5, 16);
      line(-i*jedDuzina, -4, -i*jedDuzina, 4);
      text(-i, -14, i*jedDuzina+3);
      line(-4, i*jedDuzina, 4, i*jedDuzina);
      text(i, 11, -i*jedDuzina+3);
      line(-4, -i*jedDuzina, 4, -i*jedDuzina);
    }
    popMatrix();
  }
}

int p = 300;
int p2 = p/2;
