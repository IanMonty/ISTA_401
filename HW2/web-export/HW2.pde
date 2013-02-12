import java.util.*;

List<Word> words;

PFont font = createFont("Arial", 16);
PFont font2 = createFont("times", 16);
PFont font3 = createFont("Eurostile", 16);
PFont font4 = createFont("Courier", 16);
PFont font5 = createFont("Mistral", 16);

/*
ADJ:quick,brown,agile
NOUN:fox,dog,person
VERB:jump,bark
*/

void setup() {
  size(500,700);
  
  Map<String, List<String>> wordMap = loadInWords("words.txt");  //calls word mapping fuction
  
  /*
  for (string k : wordMap.keySet()) {
    // println("key = " + k);
    
    List<String> values = wordMap.get(k);
    
    for (String v : value) {
      //println("\tvalue = " + v);
    }
  }
  */
  
  words = parseGrammar(wordMap, "grammar.txt");  //calls grammar mapping function
}

/***
  loads in a text file indicating words associated with parts of speech, parses
  and returns a Map of each part of speech and its associated List of words.
  Assumes each line looks a like:
  
    POS:word1,word2,...,wordN
***/
Map<String, List<String>> loadInWords(String filename) {
  
  Map<String, List<String>> m = new HashMap<String, List<String>>();
  
  String[] lines = loadStrings(filename);  //loads words into a string
  
  for (int i = 0 ; i < lines.length; i++) {  
    //println(lines[i]);
    String[] chop = split(lines[i], ':'); 
    
    String POS = chop[0];
    String wordsStr = chop[1];
    //println("\tLEFT SIDE = " + POS);
    //println("\tRIGHT SIDE = " + wordsStr + "\n");
    
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    List<String> wordsList = Arrays.asList(wordsArr); //turns array into a List
    
    
    
    for(String tmpStr : wordsList) {
      //println("\tword="+tmpStr);
    }
    
    
    m.put(POS, wordsList);
  }
  
  return m;  //word list
}
  
/***
  Reads through a text file of parts of speech and looks thorugh a Map m for a random word
  that corresponds to each part of speech. Returns a populated List of Word objects, where
  each type of Word has its own render() method.
***/

List<Word> parseGrammar( Map<String, List<String>> m, String filename) {
  
  List<Word> ws = new ArrayList<Word>();
  // TO DO -
  //1.  Load in Strings form "grammar.txt" and loop each line.
  String[] lines = loadStrings(filename);
  
  for(String line : lines) {
    //println(line);
    
    String[] posArr = line.split(" ");
    List<String> postList = Arrays.asList(posArr); //turns array into a List
    
    for (String p : postList) {
      //println("\t" + p);
      
      List<String> listOfWords = m.get(p);
      
      int randNum = (int) random(0, listOfWords.size());
      
      String randomWord = listOfWords.get( randNum );
      
      Word w;
      if (p.equals("NOUN")) {
        w = new WordNoun(randomWord, p);
      } else if (p.equals("ADJECTIVE")) {
        w = new WordAdj(randomWord, p);
      } else if (p.equals("VERB")) {
        w = new WordVerb(randomWord, p);
      } else if (p.equals("ADVERB")){
        w = new WordAdverb(randomWord, p);
      } else if (p.equals("DETERMINER")){
        w = new WordDeterminer(randomWord, p);
      } else if (p.equals("PLURAL_NOUN")){
        w = new WordPluralNoun(randomWord, p);
      } else if (p.equals("PREPOSITION")) {
        w = new WordPreposition(randomWord, p);
      } else if (p.equals("CONTRACTION")){
        w = new WordContraction(randomWord, p);
      } else if (p.equals("POSSESSIVE_NOUN")) {
        w = new WordPossessiveNoun(randomWord, p);
      } else if (p.equals("CONJUNCTION")) {
        w = new WordConjunction(randomWord, p);
      } else if (p.equals("PROPER_NOUN")) {
        w = new WordProperNoun(randomWord, p);
      } else if (p.equals("POSSESSIVE_DETERMINER")) {
        w = new WordPossessiveDeterminer(randomWord, p);
      } else if (p.equals("PRONOUN")) {
        w = new WordPronoun(randomWord, p);
      } else if (p.equals("PAST_TENSE_VERB")) {
        w = new WordPastTenseVerb(randomWord, p);
      } else if (p.equals("PLURAL_PRONOUN")) {
        w = new WordPluralPronoun(randomWord, p);
      } else if (p.equals("CARDINAL_NUMBER")) {
        w = new WordCardinalNumber(randomWord, p);
      } else if (p.equals("EXCLAIM")) {
        w = new WordExclaim(randomWord, p);
      } else if (p.equals("Explitive")) {
        w = new WordExplitive(randomWord, p);
      } else {
        w = new Word(randomWord, p);
      }
      
      ws.add(w);
    }
  }
    
  //2. For each POS in the line, get the associated List of words from Map m.
  //3. Choose a random word from the list.
  //4.  Place this word in a List that we will read from the draw() loop.
    
  return ws;
}




void draw() {
  background(255,255,255,255);
  
  int pX = 10;
  int pY = 40;
  
  for (Word w : words) {
    w.render(pX, pY);
    
    int sw = (int)textWidth(w.word);
    pX += sw + 10;
    
    if (pX + 2 * sw > width) {
      pX = 10;
      pY += 40;
    }
  }
  
  
}

public class Word {
  
  String word;
  String POS;
  
  public Word(String _w, String _pos) {
    this.word = _w;
    this.POS = _pos;
  }
  
  public void render(int x, int y) {
    textFont(font, 16);
    fill(0,0,0,255);
    text(word, x, y);
    
    
  }
  
}
public class WordAdj extends Word {
  
  public WordAdj(String _w, String _pos) {
    super(_w, _pos);
  }
  int ranText = (int) random(1,5);
  int randMov = (int) random(-5,5);
  
  public void render(int x, int y) {
       
    if (ranText == 1) {
      textFont(font, 16);
    } else if (ranText == 2) {
      textFont(font2, 16);
    } else if (ranText == 3) {
      textFont(font3, 16);
    } else if (ranText == 4) {
      textFont(font4, 16);
    } else {
      textFont(font5, 16);
    }
    
    fill(0,0,0,255);
    text(word,x+randMov, y+randMov);

  }
  
}
public class WordAdverb extends Word {
  public WordAdverb(String _w, String _pos) {
    super(_w, _pos);
  }
  
  int ranText = (int) random(1,5);
  float randFall = (float) random(0,.1);
  float t = 0.0;
  
  public void render(int x, int y) {
    
    if (ranText == 1) {
      textFont(font, 16);
    } else if (ranText == 2) {
      textFont(font2, 24);
    } else if (ranText == 3) {
      textFont(font3, 32);
    } else if (ranText == 4) {
      textFont(font4, 20);
    } else {
      textFont(font5, 28);
    }
    
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t += randFall;
    } else if (mousePressed == false && pow(t,3) > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t -= randFall;
    } else {
      text(word, x, y);
      t = 0;
    }
  }
}
public class WordCardinalNumber extends Word {
  public WordCardinalNumber(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float) random(0,.1);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t += randFall;
    } else if (mousePressed == false) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t -= randFall;
    } else {
      text(word,x,y);
      t = 0.0;
    }
  }
  
}
public class WordConjunction extends Word {
  public WordConjunction(String _w, String _pos) {
    super(_w, _pos);
  }
  
  int ranText = (int) random(1,5);
  int randMov = (int) random(-5,5);
  float t = 0.0;
  float randFall = (float) random(0,.1);
  int randSize = (int) random(12,32);
  
  public void render(int x, int y) {
        
    if (ranText == 1) {
      textFont(font, randSize);
    } else if (ranText == 2) {
      textFont(font2, randSize);
    } else if (ranText == 3) {
      textFont(font3, randSize);
    } else if (ranText == 4) {
      textFont(font4, randSize);
    } else {
      textFont(font5, 16);
    }
    fill(0,0,0,255);
    
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x-randMov, y+randMov + pow(t,2));
      t +=randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x-randMov, y+randMov+pow(t,2));
      t -=randFall;
    } else {
      text(word, x-randMov, y+randMov);
      t = 0;
    }
  }
  
}
public class WordContraction extends Word {
  public WordContraction(String _w, String _pos) {
    super(_w, _pos);
  }
  int randSize = (int) random(10,36);
  float randFall = (float)random(0,.2);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, randSize);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordDeterminer extends Word {
  public WordDeterminer(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float) random(0,.1);
  float t = 0.0;
  
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t += randFall;
    } else if (mousePressed == false && pow(t,3) > 0.0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word,x,y+pow(t,2));
      t -=randFall;
    } else {
      text(word,x,y);
      t = 0.0;
    }
  }
  
}
public class WordExclaim extends Word {
  public WordExclaim(String _w, String _pos) {
    super(_w, _pos);
  }
  float randFall = (float) random(0,.1);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t -= randFall;
    } else {
      text(word, x,y);
      t = 0.0;
    text(word, x, y);
    }
  }
  
}
public class WordExplitive extends Word {
  public WordExplitive(String _w, String _pos) {
    super(_w, _pos);
  }
  
  int randSize = (int)random(16,32);
  float randFall = (float)random(0,.1);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x, y+pow(t,2));
      t -= randFall;
    } else {
      text(word, x, y);
    }
  }
  
}
public class WordNoun extends Word {
  
  public WordNoun(String _w, String _pos) {
    super(_w, _pos);
  }
  
  int randMovX = (int) random(-5,5);
  int randMovY = (int) random(-5,5);
  int randSize = (int) random(16,32);
  float t = 0.0;
  float randFall = (float) random(0,.1);
  public void render(int x, int y) {
    
    textFont(font2, randSize);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x+randMovX, y+randMovY + pow(t,2));
      t += randFall;
    } else if (mousePressed == false && pow(t,3) > 0.0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
      text(word, x+randMovX, y+randMovY+pow(t,2));
      t -= randFall;
    } else {
      text(word, x+randMovX, y+randMovY);
      t = 0;
    }
    
  }
  
}
public class WordPastTenseVerb extends Word {
  public WordPastTenseVerb(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float) random(0,.3);
  float t = 0.0;
  
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordPluralNoun extends Word {
  public WordPluralNoun(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float) random(0,.2);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordPluralPronoun extends Word {
  public WordPluralPronoun(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float)random(0,.1);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordPossessiveDeterminer extends Word {
  public WordPossessiveDeterminer(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float)random(0,.1);
  float t = 0.0;
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordPossessiveNoun extends Word {
  public WordPossessiveNoun(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float)random(0,.5);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordPreposition extends Word {
  public WordPreposition(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float)random(0,.1);
  float t = 0.0;
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordPronoun extends Word {
  public WordPronoun(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float t = 0.0;
  float randFall = (float) random(0, .1);
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
   
    
  }
  
}
public class WordProperNoun extends Word {
  public WordProperNoun(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float)random(0,.1);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }
  
}
public class WordVerb extends Word {
  
  public WordVerb(String _w, String _pos) {
    super(_w, _pos);
  }
  
  float randFall = (float) random(0,.1);
  float t = 0.0;
  
  public void render(int x, int y) {
    textFont(font2, 16);
    fill(0,0,0,255);
    if (mousePressed == true) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t += randFall;
    } else if (mousePressed == false && t > 0) {
      stroke(250,250,250,mouseX);
      strokeWeight(15);
      line(x+textWidth(this.word)/2,y-12,x+textWidth(this.word)/2,y+pow(t,2)-12);
     text(word, x, y+pow(t,2));
     t -= randFall;
    } else {
     text(word, x, y);
     t = 0;
    } 
  }

}

