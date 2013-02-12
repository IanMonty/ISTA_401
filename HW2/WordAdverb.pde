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
