// Wallpaper Lab Activity by Pricilla Tran 13532686

// Basic including Rotation
float xpos, ypos, w;
int z;
float spdX, spdY, theta, rotSpd;

// Directioning 
float cornerRadiusOffset, dynamicRadius, collisionTheta;

// EIF Data
Table xy;
int index = 2;

void setup() {
  // Basic 
  size(800,800);
  background(0);
  
  frameRate(100);
  xpos = width/5; // Change these to change the translation
  ypos = height/5; // Change these to change the translation
  w = 150; // Change this for the x and y points of the ellipse 
  
  // Rotations
  spdX = 3.5; // Change speed in the X direction
  spdY = 2.9; // Change speed in the Y direction
  rotSpd = PI/180; // Rotation Speed
  
  // EIF Data 
  xy = loadTable("http://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2020-08-17T15%3A48%3A09&rToDate=2020-08-19T15%3A48%3A09&rFamily=wasp&rSensor=ES_C_13_302_C88E&rSubSensor=BAT", "csv");
}

void draw(){
  
  // EIF 
  if (index < xy.getRowCount()) 
    // read the 2nd column (the 1), and read the row based on index which increments each draw()
    z = xy.getInt(index, 1); // index is the row, 1 is the column with the data.
    println(z);
    index++;
  
  // Drawing 
  pushMatrix();
  filter(BLUR, 1); 
  translate(xpos,ypos); // Translation: needed for the path to start 
  rotate(theta); // Rotation: gives curved path rather than a straight path
  fill(random(255), z, random(255)); // used z in the Green value to see what colour scheme it will produce
  ellipse(-w/2, -w/2, z, z); // Used z (EIF) to determine the radius of the circle
  popMatrix();
  xpos += spdX;
  ypos += spdY;
  theta += rotSpd;
  collide();
  
}

void collide() {
  cornerRadiusOffset = w/2/cos(PI/4) - w/2; //calcuate difference between corner and side
  dynamicRadius = abs(sin(collisionTheta)*cornerRadiusOffset);
  
  // used z to determine the boundaries
  
  if (xpos > width-z-dynamicRadius) {
    spdX *= -1;
    rotSpd *= -1;
  } 
  else if (xpos < z+dynamicRadius) {
    spdX *= -1;
    rotSpd *= -1;
  }
  if (ypos > height-z-dynamicRadius) {
    spdY *= -1;
    rotSpd *= -1;
  } 
  else if (ypos < z+dynamicRadius) {
    spdY *= -1;
    rotSpd *= -1;
  }
  // used to calculate dynamicRadius
  collisionTheta += rotSpd*2;
}
