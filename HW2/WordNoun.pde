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
