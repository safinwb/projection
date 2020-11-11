int s1_x = 300;
int s1_y = 500;
int s2_x = 500;
int s2_y = 500;

//Variables for later
int x_input = 0;
int y_input = 0;
int d = abs(s1_x - s2_x);    //distance between two reference
float d1 = 0;
float d2 = 0;

//Angle BAC
float angle_bac;


float C;
float B;
float A;
float D;
float x_out;
float y_out;


void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  noCursor();
  target();
  text();
  myMath();
  x_input = mouseX;
  y_input = mouseY;
  line();
  fill(0);
  strokeWeight(2);
  ellipse(x_input, y_input, 10, 10);
  ref();
}

void ref() {
  fill(0);
  ellipseMode(RADIUS);
  stroke(255, 255, 255);
  strokeWeight(2);
  ellipse(s1_x, s1_y, 10, 10);
  ellipse(s2_x, s2_y, 10, 10);
  fill(255, 1);
  stroke(52, 235, 128);
  strokeWeight(3);
  ellipse(x_out, y_out, 18, 18);
}

void target(){
  stroke(97, 97, 97, 80);
  strokeWeight(5);
  ellipse(400, 250, 20, 20);
  ellipse(400, 250, 50, 50);
  ellipse(400, 250, 80, 80);
  ellipse(400, 250, 120, 120);
  ellipse(400, 250, 160, 160); 
}

void line() {
  stroke(255);
  line(s1_x, s1_y, s2_x, s2_y);
  line(s1_x, s1_y, x_input, y_input);
  line(s2_x, s2_y, x_input, y_input);

}

void text() {
  fill(255);
  String a = "D = " + str(d);
  text(a, 380, 520, 70, 80);  // Text wraps within text box
  String b = "AC = " + str(d1);
  text(b, 250, 520, 70, 80);  // Text wraps within text box
  String c = "BC = " + str(d2);
  text(c, 520, 520, 70, 80);  // Text wraps within text box
  String d = "C: (" + str(x_input) +(", ")+ str(y_input) +(")");
  text(d, mouseX, mouseY-30);
  text("A", 265, 505);
  text("B", 525, 505);
  String output = str(x_out) + " , " + str(y_out);
  text(output, 10, 20);
}

void myMath() {
  d1 = sqrt(pow((x_input - s1_x), 2) + pow((y_input - s1_y), 2));
  d2 = sqrt(pow((x_input - s2_x), 2) + pow((y_input - s2_y), 2));
  
  //Trig Math
  B = acos((pow(d, 2) + pow(d2, 2) - pow(d1, 2))/(2*d2*d));
  A = acos((pow(d1, 2) + pow(d, 2) - pow(d2, 2))/(2*d1*d));
  x_out = s1_x + d1*cos(A);
  y_out = s2_y + -d1*sin(A);
  //D = (d *sin(A) * sin(B))/sin(A + B);
  //x_out = s1_x + (D/tan(A));
  //y_out = s2_y - D;
}
