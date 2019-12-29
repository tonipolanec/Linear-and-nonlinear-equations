String[] formule;
//Float[] values = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
String[] znakovi = new String[6];
boolean[] xJednadzba = {false, false, false, false, false, false};
int znakIndex = 0;
int jedDuzina;
float max = 3;
int nPravaca;

Koordinatni_sustav koordinatni;
Jednadzba[] pravci = new Jednadzba[6];

Button buttonNovaJednadzba, buttonIzbrisiJednadzbu, buttonMijenjajMax;


void setup() {
  size(1100, 800);

  colorMode(HSB, 100);

  odrediBoje();
  buttonNovaJednadzba = new Button("Nova jednadzba",950,50,260,60,"Nova jednadzba");
  buttonIzbrisiJednadzbu = new Button("Izbrisi",1020,120,120,40,"Izbrisi");
  buttonMijenjajMax = new Button("Mijenjaj max",885,120,130,40,"Mijenjaj X");
  
  koordinatni = new Koordinatni_sustav();
  colorMode(RGB, 255);
}




void draw() {
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  colorMode(HSB, 100);
  for (int i=0; i<ids.size(); i++) {
    pravci[i].izracunaj();
    pravci[i].show();
    pravci[i].povrsina();
  }
  colorMode(RGB, 255);
  popMatrix();
  
  koordinatni.jedinicnaDuzina();
  koordinatni.crtanje();  
   
  showMenu();
  
  buttonNovaJednadzba.show();
  buttonNovaJednadzba.isPressed();
  
  buttonIzbrisiJednadzbu.show();
  buttonIzbrisiJednadzbu.isPressed();
 
  buttonMijenjajMax.show();
  buttonMijenjajMax.isPressed();
  
  ispisiJednadzbe();
  pretvoriJednadzbe();
  
  brisi();
  resetClick();
}
