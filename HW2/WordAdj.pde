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
