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
