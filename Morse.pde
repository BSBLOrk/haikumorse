/* THIS CODE PARTLY BASED ON 

Morse Code Translator Java Applet
Copyright (C) 1999-2004  Stephen C Phillips

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

--------------------------------------------------------------------------------

You can contact me by email at: morse@scphillips.com
*/

import java.util.*;

class StringIterator {
  String s;
  int i,len;
  boolean circular;
  
  StringIterator(String s, boolean isCircular) {
    this.s = s;
    this.i = -1;
    this.len = s.length()-1;
    this.circular = isCircular;
  }

  boolean isNull() {
    if (len < 0) { return true; }
    return false;
  }

  void remove() { }

  boolean hasNext() {
    if (isNull()) { return false; }
    if (circular) { return true; }
    if (i < len) { return true; }
    return false;
  }

  char next() {
    if (i < len) {
      i=i+1;
      return s.charAt(i);
    } else {
      i = -1;
      return next();
    }
  }
}

class Morse {
  Hashtable hMorse;

  Morse() {
    
      hMorse = new Hashtable(46);

      hMorse.put(new Character('A'), ".-");
      hMorse.put(new Character('B'), "-...");
      hMorse.put(new Character('C'), "-.-.");
      hMorse.put(new Character('D'), "-..");
      hMorse.put(new Character('E'), ".");
      hMorse.put(new Character('F'), "..-.");
      hMorse.put(new Character('G'), "--.");
      hMorse.put(new Character('H'), "....");
      hMorse.put(new Character('I'), "..");
      hMorse.put(new Character('J'), ".---");
      hMorse.put(new Character('K'), "-.-");
      hMorse.put(new Character('L'), ".-..");
      hMorse.put(new Character('M'), "--");
      hMorse.put(new Character('N'), "-.");
      hMorse.put(new Character('O'), "---");
      hMorse.put(new Character('P'), ".--.");
      hMorse.put(new Character('Q'), "--.-");
      hMorse.put(new Character('R'), ".-.");
      hMorse.put(new Character('S'), "...");
      hMorse.put(new Character('T'), "-");
      hMorse.put(new Character('U'), "..-");
      hMorse.put(new Character('V'), "...-");
      hMorse.put(new Character('W'), ".--");
      hMorse.put(new Character('X'), "-..-");
      hMorse.put(new Character('Y'), "-.--");
      hMorse.put(new Character('Z'), "--..");
      hMorse.put(new Character('1'), ".----");
      hMorse.put(new Character('2'), "..---");
      hMorse.put(new Character('3'), "...--");
      hMorse.put(new Character('4'), "....-");
      hMorse.put(new Character('5'), ".....");
      hMorse.put(new Character('6'), "-....");
      hMorse.put(new Character('7'), "--...");
      hMorse.put(new Character('8'), "---..");
      hMorse.put(new Character('9'), "----.");
      hMorse.put(new Character('0'), "-----");
      hMorse.put(new Character('.'), ".-.-.-");
      hMorse.put(new Character(','), "--..--");
      hMorse.put(new Character(':'), "---...");
      hMorse.put(new Character('?'), "..--..");
      hMorse.put(new Character('\''), ".----.");
      hMorse.put(new Character('-'), "-....-");
      hMorse.put(new Character('/'), "-..-.");
      hMorse.put(new Character('('), "-.--.-");
      hMorse.put(new Character(')'), "-.--.-");
      hMorse.put(new Character('"'), ".-..-.");
      hMorse.put(new Character('@'), ".--.-.");
      hMorse.put(new Character('='), "-...-");
      hMorse.put(new Character(' '), "");
  } 
  
  String get(char c) {
    return (String)hMorse.get(Character.toUpperCase(c))+"*";
  }
  
  StringIterator getStringIteratorFor(char c) {
    return new StringIterator(get(c), false);
  }  
  
  
}
