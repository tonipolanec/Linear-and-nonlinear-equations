int value = 0;

class Button {
  int bx, by, bh, bw;
  String id, btxt;


  Button(String txt_, int x_, int y_, int w_, int h_, String id_) {
    this.bx = x_;
    this.by = y_;
    this.bh = h_;
    this.bw = w_;
    this.id = id_;
    this.btxt = txt_;
  }


  void show() {
    pushMatrix();
    rectMode(CENTER);
    noStroke();
    fill(255, 255, 0);
    rect(bx, by, bw, bh);
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text(btxt, bx, by+bh/4, bw, bh);
    rectMode(CORNER);
    popMatrix();
  }

  void isPressed() {
    if (mouseX > bx-bw/2 && mouseX < bx+bw/2 && mouseY > by-bh/2 && mouseY < by+bh/2 && value == 255) {
      if (id == "Nova jednadzba") {
        upisiJednadzbe();
      } else if (id == "Izbrisi") {
        izbrisiJednadzbu();
      }else if(id == "Mijenjaj X"){
        mijenjajMax();
      }
      value = 0;
    }
  }
  
}

void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}  
void resetClick() {
  value = 0;
}
