import processing.pdf.*;
boolean record;

PFont myfont;
String o = "splash";

void setup(){
  size(595,879);
  frameRate(20); 
  myfont = createFont("B.S.-Mono-Regular.otf", 10);
}

void draw(){
  
   if (record) {
    beginRecord(PDF, "p1_PFont_#####.pdf");
  }
  
  background(255);
  fill(0);
  textFont(myfont);
  
  // palabra fija centro
  text(o, width/2 - 10, height/2);
  
  // variable de tiempo para el movimiento
  float t = frameCount * 0.02;
  
  //texto en círculo S
  push();
  translate(305,435);
  for(int g=2; g<360; g=g+13){
    push();
    rotate(radians(g) + t); // rotación animada
    text(o.charAt(0), 5, 40);
    pop();
  }
  pop();
  
  //texto en círculo P
  push();
  translate(305,435);
  for(int g=2; g<360; g=g+15){
    push();
    rotate(radians(g) - t*1.2); // sentido contrario
    text(o.charAt(1), 40, 60);
    pop();
  }
  pop();
  
  //texto en círculo L
  push();
  translate(305,435);
  for(int g=2; g<360; g=g+15){
    push();
    rotate(radians(g) + t*0.8);
    text(o.charAt(2), 90, 50);
    pop();
  }
  pop();
  
  //texto en círculo A
  push();
  translate(305,435);
  for(int g=2; g<360; g=g+15){
    push();
    rotate(radians(g) - t);
    text(o.charAt(3), 125, 50);
    pop();
  }
  pop();
  
  //texto en círculo S
  push();
  translate(305,435);
  for(int g=2; g<360; g=g+15){
    push();
    rotate(radians(g) + t*0.6);
    text(o.charAt(4), 160, 50);
    pop();
  }
  pop();
  
  //texto en círculo H
  push();
  translate(305,435);
  for(int g=2; g<360; g=g+15){
    push();
    rotate(radians(g) - t*0.5);
    text(o.charAt(5), 190, 50);
    pop();
  }
  pop();
  
 // Letras aleatorias en bucle
for (int i = 0; i < o.length(); i++) {
  char c = o.charAt(i);
  for (int j = 0; j < 30; j++) {
    float angle = random(TWO_PI);
    
    // variable oscilante para hacer bucle
    float loop = sin(frameCount * 0.1); // oscila entre -1 y 1
    float dist = map(loop, -1, 1, 0, 300) * random(0.5, 1.2); // distancia variable
    
    float x = width/2 + cos(angle) * dist + random(-3,3);
    float y = height/2 + sin(angle) * dist + random(-3,3);
    
    textSize(10 + sin(frameCount * 0.1 + j) * 2);
    text(c, x, y);
  }
}

// Letras aleatorias en bucle 2
for (int i = 0; i < o.length(); i++) {
  char c = o.charAt(i);
  for (int j = 0; j < 30; j++) {
    float angle = random(TWO_PI);
    
    //bucle
    float loop = sin(frameCount * 0.08);
    float dist = map(loop, -1, 1, 0, 500) * random(0.5, 1.2);
    
    float x = width/2 + cos(angle) * dist + random(-3,3);
    float y = height/2 + sin(angle) * dist + random(-3,3);
    
    textSize(10 + sin(frameCount * 0.1 + j) * 2);
    text(c, x, y);
  }
}

if (record) {
    endRecord();
    record = false;
  }
}

void mousePressed() {
  record = true;
}
