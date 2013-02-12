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
