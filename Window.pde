import static javax.swing.JOptionPane.*;

int brojek = 0;


final StringList ids = new StringList( new String[] {  } );

int iZaIzbrisati = -1;

void showMenu(){
  fill(220);
 
  pushMatrix();
  translate(800,0);
  
  rect(0,0,p,height);

  popMatrix();
}

void upisiJednadzbe() {


  final String id = showInputDialog("Dodajte novu jednadzbu");
  if (id == null)   exit();

  if (brojek == 5)  showMessageDialog(null, "Previse jednadzaba!", 
    "Alert", ERROR_MESSAGE);

  else if ("".equals(id))
    showMessageDialog(null, "Prazno!!!", 
      "Alert", ERROR_MESSAGE);

  else if (ids.hasValue(id))
    showMessageDialog(null, "Jednadzba \"" + id + "\" vec postoji!!!", 
      "Alert", ERROR_MESSAGE);

  else {
    brojek++;
    ids.append(id);
  }

  //brisi();
}

float[] aa = new float[5];
float[] bb = new float[5];
String[] zz = new String[5];

Pretvorba[] pret = new Pretvorba[5];

//-------------BARVICE------------------------

int barvice[] = new int[5];

IntList boje = new IntList( new int[] { 100, 80, 66, 35, 15 } );

void odrediBoje() {
  boje.shuffle();
  for (int i = 0; i< 5; i++) {
    barvice[i] = boje.get(i);
  }
}


void ispisiJednadzbe() {  

  for (int i=0; i<ids.size(); i++) { 
    if (ids.get(i) != null)
      pret[i] = new Pretvorba(ids.get(i));
  }

  pushMatrix();
  translate(820, 150);
  stroke(0, 0, 0, 14);
  strokeWeight(3);
  line(0, 0, p-40, 0);
  //rectMode(CORNER);
  rectMode(CENTER);


  textSize(28);
  stroke(0);
  colorMode(HSB, 100);
  for (int i=0; i<ids.size(); i++) {   

    if (ids.get(i) != null) {
      if (pret[i].vrstaJednadzbe() == "normalna") {
        if (pret[i].b() >= 0) {          
          fill(barvice[i], 100, 100, 100);
          noStroke();
          ellipse(250, 50*(i+1)-10, 20, 20);
          fill(0);

          text(("y " + pret[i].znak() + " " + pret[i].a() + "x +" + pret[i].b()), 120, 50*(i+1)/*,260,35*/);
        } else {
          fill(barvice[i], 100, 100, 100);
          noStroke();
          ellipse(250, 50*(i+1)-10, 20, 20);
          fill(0);

          text(("y " + pret[i].znak() + " " + pret[i].a() + "x " + pret[i].b()), 120, 50*(i+1)/*,260,35*/);
        }
      } else if (pret[i].vrstaJednadzbe() == "paralelnaX") {
        fill(barvice[i], 100, 100, 100);
        noStroke();
        ellipse(250, 50*(i+1)-10, 20, 20);
        fill(0);

        text(("y " + pret[i].znak() + " " + pret[i].xyA()), 120, 50*(i+1)/*,260,35*/);
      } else if (pret[i].vrstaJednadzbe() == "Xjednadzba") {
        fill(barvice[i], 100, 100, 100);
        noStroke();
        ellipse(250, 50*(i+1)-10, 20, 20);
        fill(0);

        text(("x " + pret[i].znak() + " " + pret[i].xyA()), 120, 50*(i+1)/*,260,35*/);
      }
    }
  }
  colorMode(RGB, 255);
  rectMode(CORNER);

  popMatrix();

}

void pretvoriJednadzbe() {
  //int h = int(random(100));
  for (int i = 0; i< ids.size(); i++) {

    if (pret[i] != null) {

      if (pret[i].vrstaJednadzbe() == "normalna") {
        pravci[i] = new Jednadzba(pret[i].znak(), pret[i].a(), pret[i].b(), barvice[i], pret[i].vrstaJednadzbe());
        if (abs(pret[i].b()) >= max) {
          max = abs(pret[i].b()) +2;
        }
      } else if (pret[i].vrstaJednadzbe() == "paralelnaX") {
        pravci[i] = new Jednadzba(pret[i].znak(), 0, pret[i].xyA(), barvice[i], pret[i].vrstaJednadzbe());
        if (abs(pret[i].xyA()) >= max) {
          max = abs(pret[i].xyA()) +2;
        }
      } else if (pret[i].vrstaJednadzbe() == "Xjednadzba") {
        pravci[i] = new Jednadzba(pret[i].znak(), pret[i].xyA(), 0, barvice[i], pret[i].vrstaJednadzbe());

        if (abs(pret[i].xyA()) >= max) {
          max = abs(pret[i].xyA()) +2;
        }
      }
      nPravaca++;
    }
  }
}


//--------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------DRUGI WINDOW--------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------

void izbrisiJednadzbu() {
  
  String idd = showInputDialog("Broj jednadzbe koju zelite izbrisati");
  if (idd == null)   exit();


  else if ("".equals(idd))
    showMessageDialog(null, "Prazno!!!", 
      "Alert", ERROR_MESSAGE);

  else {
    iZaIzbrisati = parseInt(idd)-1;
  }
}

void brisi() {
  if (iZaIzbrisati != -1) {
    ids.remove(iZaIzbrisati);
    iZaIzbrisati = -1;
    brojek--;
    nPravaca--;
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------TRECI WINDOW--------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------

float noviMax = max;

void mijenjajMax(){
  
  String n = showInputDialog("Do kojeg broja zelis vidjeti?");
  if (n == null)   exit();

  else if ("".equals(n))
    showMessageDialog(null, "Prazno!!!", 
      "Alert", ERROR_MESSAGE);

  else {
    noviMax = parseInt(n);
  }
  
    max = noviMax;
}
