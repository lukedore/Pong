class Ball {
  float x;
  float y;
  float angle; //in degrees
  float speed;
  int lives = 3;
  
  Ball() {
    x = width/2;
    y = height/2;
    speed = 3;
    angle = radians( 25 );
  }
  
  void display() {
    ellipse(x, y, 20, 20);
  }
  
  void move() {
    x += speed * cos(angle);
    y += speed * sin(angle);
  }
  
  float getY() {
    return y;
  }
  
  void increaseSpeed() {
    speed +=1;
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
    } else if( x <= 30 || x >= (width-30) ) {
      bounce();
    } else if( x > width + 10) {
      lives--;
    }
  }
}
  