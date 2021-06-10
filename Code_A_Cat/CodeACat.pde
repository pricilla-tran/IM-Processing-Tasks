//SETTINGS
size(800,800);
background(178, 178, 255);

// VARIABLES 
// Head
float headHeight = 400; 
float headWidth = headHeight;
float head_x = width/2;
float head_y = (height)/2;

// Eyes
float eyeWidth = headWidth/12;
float eyeHeight = headHeight/8;
float eye_y = head_y-eyeWidth*2;
float lefteye_x = head_x-eyeHeight;
float righteye_x = lefteye_x + eyeHeight*2;

// Nose
float noseWidth = eyeHeight/2;
float noseHeight = eyeWidth/2;
float nose_x = head_x;
float nose_y = head_y;

// Mouth
float mouthWidth = headWidth/5;
float mouthHeight = headHeight/3;
float mouth_y = nose_y + 10;
float Leftmouth_x = head_x - (headWidth/10);
float Rightmouth_x = head_x + (headWidth/10);

// Whiskers
float whisker1_x1 = head_x + headWidth/8;
float whisker1_y1 = head_y + headHeight/20;
float whisker1_x2 = head_x + headWidth/2;
float whisker1_y2 = head_y - headHeight*3/20;

float whisker2_x1 = whisker1_x1;
float whisker2_y1 = head_y + 2*head_y/20;
float whisker2_x2 = whisker1_x2;
float whisker2_y2 = whisker2_y1;

float whisker3_x1 = whisker2_x1;
float whisker3_y1 = head_y/1.2 + 6*head_y/20;
float whisker3_x2 = whisker2_x2;
float whisker3_y2 = head_y + 5*head_y/20;

// Ears
float ear_x1 = head_x - headWidth/10*2;
float ear_y1 = head_y- (headHeight)/10*4.5;

float ear_x2 = head_x - headWidth/10*4.5;
float ear_y2 = head_y- (headHeight)/10*2;

float ear_x3 = head_x - headWidth/10*6;
float ear_y3 = head_y- (headHeight)/10*6.5;

// Body
float bodyHeight = headHeight*2;
float bodyWidth = headWidth*1.5;
float body_x = head_x;
float body_y = head_y*2;

// Tummy
float tummyHeight = bodyHeight/3;
float tummyWidth = bodyWidth/2;
float tummy_x = body_x;
float tummy_y = body_y;

// DRAWING COMPONENT

// Draw Body
fill(255, 210,127);
ellipse(body_x, body_y, bodyWidth, bodyHeight);

// Draw Tummy
fill(255, 229, 234);
ellipse(tummy_x, tummy_y, tummyWidth, tummyHeight);

// Draw Ears
fill(255, 210, 127);
triangle(ear_x1, ear_y1, ear_x2, ear_y2, ear_x3, ear_y3);
triangle(width-ear_x1, ear_y1, width-ear_x2, ear_y2, width-ear_x3, ear_y3);

// Draw Head
fill(255, 210, 127);
ellipse(head_x, head_y, headWidth, headHeight);

// Draw Eyes 
fill(0);
ellipse(lefteye_x, eye_y, eyeWidth, eyeHeight);
ellipse(righteye_x, eye_y, eyeWidth, eyeHeight);

// Draw Nose
fill(255, 229, 234);
ellipse(nose_x, nose_y, noseWidth, noseHeight);

// Draw Mouth 
noFill();
arc(Leftmouth_x, mouth_y, mouthWidth, mouthHeight, 0, radians(135));
arc(Rightmouth_x, mouth_y, mouthWidth, mouthHeight, radians(45), radians(180));

// Draw Whiskers 
line(whisker1_x1, whisker1_y1, whisker1_x2, whisker1_y2); 
line(width-whisker1_x1, whisker1_y1, width-whisker1_x2, whisker1_y2); 
line(whisker2_x1, whisker2_y1, whisker2_x2, whisker2_y2); 
line(width-whisker2_x1, whisker2_y1, width-whisker2_x2, whisker2_y2); 
line(whisker3_x1, whisker3_y1, whisker3_x2, whisker3_y2); 
line(width-whisker3_x1, whisker3_y1, width-whisker3_x2, whisker3_y2);
