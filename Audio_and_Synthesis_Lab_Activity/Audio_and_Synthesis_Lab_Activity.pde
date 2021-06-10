import beads.*;
import java.util.Arrays; 

AudioContext ac;
Envelope e;
Glide freq;
color buttonColour;
color pressedColour;
float cf = 70;

int circleSize; // Size of play button 
int cir_X, cir_Y; // circle position 
boolean circleOver = false;
float value = 1.5;

void setup() {
  size(600,300);
  frameRate(200);
  ac = new AudioContext();
  
  initialise(); 
  sound();
}

void initialise() {
  circleSize = width/3; // 200
  cir_X = width/2; // 300
  cir_Y = height/2; // 150
  
  buttonColour = color(#F06174);
  pressedColour = color(#3FBC5B);
  
}

void draw() {
  update(mouseX, mouseY);
  background(155,160,155);
  
  fill(buttonColour);
  circle(cir_X, cir_Y, circleSize);
}

void mousePressed() {
  
  if (circleOver && buttonColour == #F06174) {
    buttonColour = pressedColour;
    ac.start();
  }
  else {
    buttonColour = #F06174;
    ac.stop();
  }
}

void keyPressed() {
  
  // Increase Envelope- You have been warned! Don't press it too many times
  if ((key == 'a')) {
    value += 0.1;
    sound();
  }
  
  // Decrease Envelope
  if ((key == 'z')) {
    value -= 0.1;
    sound();
  }
  
  // Increase Carrier Frequency 
  if ((key == 'c')) {
    cf += 0.5;
    sound();
  }
  
  // Decrease Carrier Frequency 
  if ((key == 'f')) {
    cf -= 0.5;
    sound();
  }
}

void update(int x, int y) {
  if ( overCircle(cir_X, cir_Y, circleSize) ) {
    circleOver = true;
  } else {
    circleOver = false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void sound() {
  // Glide 
  freq = new Glide(ac, 100);
  freq.setGlideTime(250);
  
  e = new Envelope(ac, value);
  
  // Harmonic Ratio- int for harmonic, non-int for inharmonic tones (eg bells) 
  float harmonicRatio = 2;
  
  WavePlayer wp = new WavePlayer(ac, cf * harmonicRatio, Buffer.SINE);
  
   Gain g = new Gain(ac,1,e);
  
   g.addInput(wp);
   ac.out.addInput(g);
}
