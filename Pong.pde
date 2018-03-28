int lrecty;
int rrecty;
int ldirection;
Ball ball; 
String display;

final int TOP = 0;
final int BOTTOM = 1;

void setup() {
  //setup for the screen
  size(640, 480);
  lrecty = height/2;
  rrecty = height/2;
  
  //Displaying Lives and Score
  textSize(28);
  display = "Lives - ooo";
  
  //Place the ball
  ball = new Ball();
}

void draw() {
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      lrecty -= 10;
    } else if(key == 's'|| key == 'S') {
      lrecty += 1;
    }/* else if(key == 'o'|| key == 'O') {
      rrecty -= 1;
    } else if(key == 'l'|| key == 'L') {
      rrecty += 1;
    }*/
  }
  ball.hit();
  background(0);
  fill(204, 102, 0);
  text(display, float(width/2-80), 25);
  fill(100, 30, 200);
  rect(10, ball.getY() -30, 20, 60);
  rect(width -30, mouseY -30, 20, 60);
  ball.move();
  ball.display();
}