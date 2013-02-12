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
