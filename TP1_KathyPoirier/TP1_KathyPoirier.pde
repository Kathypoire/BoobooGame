int w = 640;
int h = 640;

int sectionActiveAtStartup = 1;

int sectionActive = sectionActiveAtStartup;


float r = 0;          //rouge
float g = 0;          //vert
float b = 0;          //bleu

float range = 500; //taille du slider
float yrange = 10;
float min = 0;
float max = 255;

//emplacement des sliders
float xR = w / 2;         
float xG = w / 2;         
float xB = w / 2;         

float yR = w/3 * 2.3;         
float yG = w/3 * 2.5;         
float yB = w/3 * 2.7;        

//taille bouton slider
int kw = 15; 
int kh = 35; 

String[]headline = {"Booboo Game"};
PFont agenda, alba;
float x;
int index = 0;
float y;
float easing = 0.07;


color colorButtonNormal = color(255, 219, 255);
color colorButtonInside = color(157, 255, 246);
color colorButtonPressed = color(450, 300, 200);


// variable qui contient l'état
boolean isButtonPressed;
boolean isMouseInsideButton;

float buttonPositionX;
float buttonPositionY;
float buttonWidth;
float buttonHeight;
float buttonScaleUp;
float buttonScaleDown;
float buttonMinX;
float buttonMinY;
float buttonMaxX;
float buttonMaxY;


void setup() {
  size(640,640);      
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  agenda = loadFont("Agenda-Regular-48.vlw");
  alba = loadFont("Alba-48.vlw");
  
  x = width+240 ;
  
  
  buttonPositionX = width / 2.0f;
  buttonPositionY = height / 2.0f;
  buttonWidth = width * 0.35f;
  buttonHeight = height * 0.35f;
  buttonScaleUp = 1.05f;
  buttonScaleDown = 0.96f;
  buttonMinX = buttonPositionX - (buttonWidth / 2.0f);
  buttonMinY = buttonPositionY - (buttonHeight / 2.0f);
  buttonMaxX = buttonPositionX + (buttonWidth / 2.0f);
  buttonMaxY = buttonPositionY + (buttonHeight / 2.0f);
  isButtonPressed = false;
  isMouseInsideButton = false;
  
}


void draw()
{
  switch (sectionActive)
  {
    case 1:
      drawSection1();
      break;
    case 2:
      drawSection2();
      break;
  }
}

void drawSection1() {

  
  if(r < min) { r = min; } else if(r > max) { r = max; }
  if(g < min) { g = min; } else if(g > max) { g = max; }
  if(b < min) { b = min; } else if(b > max) { b = max; }
  
  
  background(r,g,b);
  noStroke();
  textAlign(CENTER, CENTER);

if (mouseX >= buttonMinX && mouseX <= buttonMaxX)
  {
    if (mouseY >= buttonMinY && mouseY <= buttonMaxY)
    {
     
      isMouseInsideButton = true;
    }
 else
      isMouseInsideButton = false;
  }
  else
    isMouseInsideButton = false;

  
  if (isButtonPressed == true)
  {
    
    fill(colorButtonPressed);
    rect(buttonPositionX, buttonPositionY, buttonWidth * buttonScaleDown, buttonHeight * buttonScaleDown);
    
   

  }
  else if (isMouseInsideButton == true) 
  {
    fill(colorButtonInside);
    rect(buttonPositionX, buttonPositionY, buttonWidth * buttonScaleUp, buttonHeight * buttonScaleUp);
    filter(BLUR);
  }
  else 
  {
   
    fill(colorButtonNormal);
    rect(buttonPositionX, buttonPositionY, buttonWidth, buttonHeight);
  }
  
  
  strokeWeight(4);
  stroke(#91DAFC);
  
  fill(r,0,0);
  rect(xR,yR,range,yrange,8);
  
  
  fill(0,g,0);
  rect(xG,yG,range,yrange,8);
  
  
  fill(0,0,b);
  rect(xB,yB,range,yrange,8);
  
  
  fill(255);
  
  float rX = map(r,min,max,xR - range/2, xR + range/2);
  float gX = map(g,min,max,xG - range/2, xG + range/2);
  float bX = map(b,min,max,xB - range/2, xB + range/2);
  
  ellipse(rX,yR,kw,kh);
  ellipse(gX,yG,kw,kh);
  ellipse(bX,yB,kw,kh);
  
  if(mousePressed) {
    if(mouseX > xR - range/2 && mouseX < xR + range/2) { if(mouseY > yR - yrange/2 && mouseY < yR + yrange/2) { r = map(mouseX,w/2 - range/2,550,min,max); }}
    
    if(mouseX > xG - range/2 && mouseX < xG + range/2) { if(mouseY > yG - yrange/2 && mouseY < yG + yrange/2) { g = map(mouseX,w/2 - range/2,550,min,max); }}
    
    if(mouseX > xB - range/2 && mouseX < xB + range/2) { if(mouseY > yB - yrange/2 && mouseY < yB + yrange/2) { b = map(mouseX,w/2 - range/2,550,min,max); }}
  }
  
stroke(#91DAFC);
strokeWeight(4);
noFill();
square(320,320,260);  

textFont(agenda);
textSize(30);
fill(255);
text("Enter",width/2,height/2);
  
textFont(alba); 
textSize(60);
fill(#91DAFC);
text(headline[index],x,110);

x = x-3;

  float w = textWidth(headline[index]);
  if (x < -w) {
    x = width+240;
    index = (index + 1) % headline.length;
  }
  

}


void drawSection2()
{

   
background(255);

 
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;


circle(x, y, 69);
circle(x+15,y-5,10); 
circle(x-15,y-5,10);
line(x-5, y+10,x+5,y+10);
fill(0);
  
textAlign(LEFT, CENTER); 
textFont(alba);
textSize(50);
text("Booboo", 40,65);


textAlign(RIGHT, CENTER); 
textFont(agenda); 
textSize(20);
text("CLICK : CHANGE COLOR",600,525);
text("UP/DOWN : INVERT", 600,550);
text("BACKSPACE : MENU", 600,575);

   
if (mousePressed) {
   stroke(random(255), random(255), random(255));
  }
  
if (keyCode == UP)
  filter(INVERT);

if (keyCode == DOWN)
  filter(INVERT);
else {
    filter(INVERT);
  }
  
}




void mousePressed()
{
{
  if (isMouseInsideButton == true)
  {
    // si le bouton gauche ou droit est enfoncé
    // ('==' : équivalence,  '||' OU logique)
    if (mouseButton == LEFT || mouseButton == RIGHT)
    {
      // le bouton passe à l'état enfoncé
      isButtonPressed = true;
      sectionActive = 2;}
   }
  }
}


void mouseReleased()
{
  if (isMouseInsideButton == true)

  isButtonPressed = false;
}


void keyReleased()
{
  if (key == '1')
    sectionActive = 1;
    
  if (key == BACKSPACE)
  sectionActive=1;

  if (key == '2')
    sectionActive = 2;
   
}
