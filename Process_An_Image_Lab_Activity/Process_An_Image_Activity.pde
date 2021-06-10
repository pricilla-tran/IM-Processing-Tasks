
PImage img;
int y, x;

int resolution = 100;
String effect_F;

void setup() {
  img = loadImage("YJH.jpg");
  surface.setSize(img.width, img.height); 
  //noLoop();
}

void keyPressed() {
  if (key == 'a') {
    resolution -= 20; 
    effect();
  }
  
  if (key == 'b') {
    resolution += 20;
    effect();
  }
  
  if (key == 'c') {
    resolution = 100;
    effect();
  }
  
  if (key == 'p') {
    filter(GRAY);
  }
}

void mouseDragged() {
  filter(POSTERIZE, mouseY/40+2);
}

void draw() {
  image(img,0,0);
  effect();
}

void effect() {
  int xInc = width/resolution;
  int yInc = height/resolution;

  for (int y=0; y<img.height; y+=yInc) {
    for (int x=0; x<img.width; x+=xInc) {
      fill(img.get(x, y));
      rect(x, y, xInc, yInc);
       //variation with line()
      strokeWeight(3);
      stroke(img.get(x, y));
      line(x, y, x+10, y+10);
    }
  }
}
