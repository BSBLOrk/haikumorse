

Morse m;
char current;
StringIterator haiku, morseSequence, timing;
String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
PImage skull;

void setup() {
  size(1200,1000);
  frameRate(1);
  haiku = new StringIterator( "sick on a journey. over parched fields. dreams wander on", true );
  morseSequence = new StringIterator( "", false ); // initialize as null for first check
  timing = new StringIterator("",false); // initialize as null for first check
  m = new Morse();
  skull = loadImage("skull.jpg");
 
}

boolean step() {  
  if (timing.hasNext()) {
    if (timing.next() == '1') {
      return true;
    } else {
      return false;
    }
  }
  char c;
  if (morseSequence.hasNext()) {
     c = morseSequence.next();
     if (c == '.') {
       timing = new StringIterator("10",false);
       //println("  .");
     } else if (c == '-') {
       timing = new StringIterator("1110",false);
       //println("  _");
     } else {
       timing = new StringIterator("000",false);
       //println("  *");
     }
     return step();
  }
  current = haiku.next();
  println(current);
  morseSequence = m.getStringIteratorFor(current);
  return step();
}

void draw() {  
  background(0);
  if (step()) {
    //fill(255);
    float dim = (1.0+alph.indexOf(Character.toUpperCase(current))) / 7.0;
    //ellipse(width/2,height/2,dim,dim);
    pushMatrix();
      translate(width/2,height/2);
      //rotate(dim);
      scale(dim);
      image(skull,-skull.width/2,-skull.height/2);
    popMatrix();
  }
  filter(INVERT);
  

}
