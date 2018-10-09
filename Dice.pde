int one = 0;
int two = 0;
int three = 0;
int four = 0;
int five = 0;
int six = 0;
int maximum = 0;
int tMaximum = 0;
int xOffset = 30;
int tOne = 0;
int tTwo = 0;
int tThree = 0;
int tFour = 0;
int tFive = 0;
int tSix = 0;
boolean buttonClicked = false;
int rectW = 50;
int rectH = 25;
void setup()
{
  noLoop();
  frameRate(10);
  size(650,650);
}
void draw()
{
  die();
  fill(146);
  rect(460,460,180,50);
  fill(255);
  text("Auto Run", 507, 492);
}
void die(){
  int sum = one = two = three = four = five = six = maximum = 0;
  background(50);
  for(int y = 20; y <= 395; y += 75){
    for(int x = 20; x<= 395; x += 75){
      Die d = new Die(x,y);
      d.roll();
      d.show();
      sum = sum + d.myDots;
    }
  }
  tOne = tOne + one;
  tTwo = tTwo + two;
  tThree = tThree + three;
  tFour = tFour + four;
  tFive = tFive + five;
  tSix = tSix + six;
  println("Sum: " + sum);
  textSize(20);
  fill(255);
  text("Current Dots: " + sum, 20, 480);
  text("1's:" + one, 20, 505);
  text("2's:" + two, 20, 530);
  text("3's:" + three, 20, 555);
  text("4's:" + four, 20, 580);
  text("5's:" + five, 20, 605);
  text("6's:" + six, 20, 630);
  text("Total Dots: " + (tOne+tTwo*2+tThree*3+tFour*4+tFive*5+tSix*6), 220, 480);
  text("Total 1's:" + tOne, 220, 505);
  text("Total 2's:" + tTwo, 220, 530);
  text("Total 3's:" + tThree, 220, 555);
  text("Total 4's:" + tFour, 220, 580);
  text("Total 5's:" + tFive, 220, 605);
  text("Total 6's:" + tSix, 220, 630);
  println("Values: " + one + " " + two + " " + three + " " + four + " " + five + " " + six);
  println("Total Values: " + tOne + " " + tTwo + " " + tThree + " " + tFour + " " + tFive + " " + tSix);
  int[] tMaxValues = {tOne, tTwo, tThree, tFour, tFive, tSix};
  tMaximum = max(tMaxValues);
  int[] maxValues = {one, two, three, four, five, six};
  maximum = max(maxValues);
  int minimum = min(tMaxValues);
  println("minimum: " + minimum);
  println("maximum: " + maximum);
  //current chart
  for(int i = 0; i < 6; i ++){
    if(i == 0){
      fill(255,154,162);
      rect(460 + xOffset * i, 20 + (200 - 200 * one/maximum), xOffset, 200 * one/maximum);
    }else if(i == 1){
      fill(255,218,193);
      rect(460 + xOffset * i, 20 + (200 - 200 * two/maximum), xOffset, 200 * two/maximum);
    }else if(i == 2){
      fill(226,240,203);
      rect(460 + xOffset * i, 20 + (200 - 200 * three/maximum), xOffset, 200 * three/maximum);
    }else if(i == 3){
      fill(181,234,215);
      rect(460 + xOffset * i, 20 + (200 - 200 * four/maximum), xOffset, 200 * four/maximum);
    }else if(i == 4){
      fill(200,213,249);
      rect(460 + xOffset * i, 20 + (200 - 200 * five/maximum), xOffset, 200 * five/maximum);
    }else{
      fill(199,206,234);
      rect(460 + xOffset * i, 20 + (200 - 200 * six/maximum), xOffset, 200 * six/maximum);
    }
  }
  //total chart
  for(int i = 0; i < 6; i ++){
    if(i == 0){
      fill(210, 110, 133);
      rect(460 + xOffset * i, 245 + (200 - 200 * tOne/tMaximum), xOffset, 200 * tOne/tMaximum);
    }else if(i == 1){
      fill(227, 150, 119);
      rect(460 + xOffset * i, 245 + (200 - 200 * tTwo/tMaximum), xOffset, 200 * tTwo/tMaximum);
    }else if(i == 2){
      fill(248, 232, 78);
      rect(460 + xOffset * i, 245 + (200 - 200 * tThree/tMaximum), xOffset, 200 * tThree/tMaximum);
    }else if(i == 3){
      fill(155, 219, 133);
      rect(460 + xOffset * i, 245 + (200 - 200 * tFour/tMaximum), xOffset, 200 * tFour/tMaximum);
    }else if(i == 4){
      fill(53, 178, 230);
      rect(460 + xOffset * i, 245 + (200 - 200 * tFive/tMaximum), xOffset, 200 * tFive/tMaximum);
    }else{
      fill(91, 77, 183);
      rect(460 + xOffset * i, 245 + (200 - 200 * tSix/tMaximum), xOffset, 200 * tSix/tMaximum);
    }
  }
  fill(0);
  text("Current Faces", 482.5, 218);
  text("Total Faces", 495, 442);
}
void mousePressed()
{
  if(mouseX >= 460 && mouseX <= 640 && mouseY >= 460 && mouseY <= 510){
    if(buttonClicked == true){
      noLoop();
      buttonClicked = false;
    }else{
      loop();
      buttonClicked = true;
    }
  }else{
    redraw();
  }
}

class Die //models one single dice cube
{
  int myX, myY, myDots;
  
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    myDots = (int)(Math.random()*6) + 1;
  }
  void show()
  {
    if(myDots == 1){
      one = one + 1;
      fill(255);
      stroke(0);
      rect(myX,myY,50,50,5);
      noStroke();
      fill(0);
      //middle
      ellipse(myX + 25, myY + 25, 10, 10);
    }else if(myDots == 2){
      two = two + 1;
      fill(255);
      stroke(0);
      rect(myX,myY,50,50,5);
      noStroke();
      fill(0);
      //top right
      ellipse(myX + 37.5, myY + 12.5, 10, 10);
      //bottom left
      ellipse(myX + 12.5, myY + 37.5, 10, 10);
    }else if(myDots == 3){
      three = three + 1;
      fill(255);
      stroke(0);
      rect(myX,myY,50,50,5);
      noStroke();
      fill(0);
      //top right
      ellipse(myX + 37.5, myY + 12.5, 10, 10);
      //middle
      ellipse(myX + 25, myY + 25, 10, 10);
      //bottom left
      ellipse(myX + 12.5, myY + 37.5, 10, 10);
    }else if(myDots == 4){
      four = four + 1;
      fill(255);
      stroke(0);
      rect(myX,myY,50,50,5);
      noStroke();
      fill(0);
      //top left
      ellipse(myX + 12.5, myY + 12.5, 10, 10);
      //top right
      ellipse(myX + 37.5, myY + 12.5, 10, 10);
      //bottom left
      ellipse(myX + 12.5, myY + 37.5, 10, 10);
      //bottom right
      ellipse(myX + 37.5, myY + 37.5, 10, 10);
    }else if(myDots == 5){
      five = five + 1;
      fill(255);
      stroke(0);
      rect(myX,myY,50,50,5);
      noStroke();
      fill(0);
      //top left
      ellipse(myX + 12.5, myY + 12.5, 10, 10);
      //top right
      ellipse(myX + 37.5, myY + 12.5, 10, 10);
      //middle
      ellipse(myX + 25, myY + 25, 10, 10);
      //bottom left
      ellipse(myX + 12.5, myY + 37.5, 10, 10);
      //bottom right
      ellipse(myX + 37.5, myY + 37.5, 10, 10);
    }else if(myDots == 6){
      six = six + 1;
      fill(255);
      stroke(0);
      rect(myX,myY,50,50,5);
      noStroke();
      fill(0);
      //top left
      ellipse(myX + 12.5, myY + 12.5, 10, 10);
      //top right
      ellipse(myX + 37.5, myY + 12.5, 10, 10);
      //middle left
      ellipse(myX + 12.5, myY + 25, 10, 10);
      //middle right
      ellipse(myX + 37.5, myY + 25, 10, 10);
      //bottom left
      ellipse(myX + 12.5, myY + 37.5, 10, 10);
      //bottom right
      ellipse(myX + 37.5, myY + 37.5, 10, 10);
    }
  }
}
