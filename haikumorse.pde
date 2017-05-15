

Morse m;
char current;
StringIterator haiku, morseSequence, timing;
String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

void setup() {
  size(1200,1000);
  frameRate(1);
  haiku = new StringIterator( "sick on a journey. over parched fields. dreams wander on", true );
  morseSequence = new StringIterator( "", false ); // initialize as null for first check
  timing = new StringIterator("",false); // initialize as null for first check
  m = new Morse();
 
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
  if (step()) {
    background(0);  
  } else {
    background(0);    
  }
}
