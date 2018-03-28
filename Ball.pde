class Ball {
  float x;
  float y;
  float angle; //in degrees
  float speed;
  int lives = 3;
  
  Ball() {
    x = width/2;
    y = height/2;
    speed = 2;
    angle = radians( random(120, 240) );
  }
  
  void display() {
    ellipse(x, y, 20, 20);
  }
  
  void move() {
    x += speed * cos(angle);
    y += speed * sin(angle);
  }
  void setSpeed( float f )
  {
    speed = f;
  }
  
  float getY() {
    return y;
  }
  
  void increaseSpeed() {
    speed +=0.4;
  }
  
  void setAngle(float a) {
    angle = a;
  }
  
  void bounce() {
    if( this.y <= 0 || y >= height -10 ) {
      println( "here y -> " + y);
      angle = 2 * PI - angle;
    }
    if( x <= 30 ) {
      //left paddle
      float t = 3 * PI / 2 - angle;
      angle = 3 * PI / 2 + t;
      speed += 1;
    } else if( x >= (width-30) ) {
      println( mouseY + " " + y + " " + (mouseY+60) );
      if( mouseY < y && (mouseY+60) > y ) {
        float t = 3 * PI / 2 - angle;
        println( "here x --> " + x);
        angle = 3 * PI / 2 + t;
        speed += 0.3;
      }
    }
  }
  
  void hit() {
    //check top and bottom
    if( y <= 0 || y >= height -10 ) {
      this.bounce();
    } else if( x > width + 10) {
      lives--;
      restart();
    } else if( x <= 30 || x >= (width-30) ) {
      bounce();
    } 
  }
  void restart() {
    x = width/2;
    y = height/2;
    speed = 3;
    angle = radians( random(120, 240) );
  }
  
  void countdown() {
    background(0);
    for(int i = 3; i > 0; i-- ) {
      textSize(48);
      fill( 0, 255, 0 );
      text( new String(""+i), float(width/2 -24), float(height/2) );
      delay(1000);
      background(0);
    }
    text( "GO!", width/2 -24, height/2 );
    delay(500);
    background(0);
  }
  int getLives() {
    return lives;
  }
}
  