
import processing.video.*;

Movie movie;

Slider slider;
float mappedSlider;

boolean pathOn = false;

void setup() {
  size(1000, 600);
  // Need to add your own clip in the same place
  movie = new Movie(this, "VideoMirrorClip.mp4");
  
  movie.loop();
  
  slider = new Slider(width/4, height/1.12, 480, 30, 16);
}

void movieEvent(Movie movie) {  
  movie.read();
}

void mouseDragged() {
  float threshold = map(mouseY, 0, 600, 0, 1);
 filter(THRESHOLD, threshold);
}

void draw() {  
  
  println(mappedSlider);
  image(movie, 0, 0, width, height);
  
  sliderOp();
  
}

// Scrollbar class
class Slider {
  int sWidth, sHeight;             // width & height of the bar
  float sliderX, sliderY;          // x & y position of the bar
  float sliderPos, sliderNewPos;   // x position of slider
  float sliderMin, sliderMax;      // min/max values of slider
  int loose;    // loose/heaviness
  boolean over; // is the mouse over the slider?
  boolean locked;
  float ratio;
  float mappedSlider;
  

  
  Slider (float xp, float yp, int sw, int sh, int l) {
    sWidth = sw;
    sHeight = sh;
    int widthToHeight = sw - sh;
    ratio = (float)sw / (float)widthToHeight;
    sliderX = xp;
    sliderY = yp-sHeight/2;
    sliderPos = sliderX + sWidth/2 - sHeight/2;
    sliderNewPos = sliderPos;
    sliderMin = sliderX;
    sliderMax = sliderX + sWidth - sHeight;
    loose = l;
   

  }
  
  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      sliderNewPos = constrain(mouseX-sHeight/2, sliderMin, sliderMax);
    }
    if (abs(sliderNewPos - sliderPos) > 1) {
      sliderPos = sliderPos + (sliderNewPos - sliderPos)/loose;
    }
   mappedSlider = map(sliderPos, sliderMin, sliderMax, 0, 100);
  }
  
  float constrain(float val, float minVal, float maxVal) {
    return min(max(val, minVal), maxVal);
  }
  
  boolean overEvent() {
    if (mouseX > sliderX && mouseX < sliderX+sWidth &&
        mouseY > sliderY && mouseY < sliderY+sHeight) {
        return true;
        }
    else {
      return false;
    }
  }
  
  void display() {
    noStroke();
    fill(#BCBCBC);
    rect(sliderX, sliderY, sWidth, sHeight);
    if (over || locked) {
      fill(0);
    } else {
      fill(102, 102, 102);
    }
    ellipse(sliderPos, sliderY+15, sHeight*1.5, sHeight*1.5);
  }
  
  float getPos() {
    return sliderPos * ratio;
  }
};

// Using Slider for Posterise Effect
void sliderOp() {
   mappedSlider = slider.sliderPos;
   slider.display();
   slider.update();
   float effect = map(mappedSlider,250,699,2,50);
   
   filter(POSTERIZE, effect);
   
}
