PShape barra;
float ang=0;

void setup() {
  size(600, 600);
  barra = createShape(RECT,0,0,10,100,5);
  frameRate(60);
}

void draw() {
  ang+=2;
  background(0);
  noStroke();
  for(int i=0;i<30;i++)
  {
    shape(barra,10+(30*i),150+(50*cos((ang+(50*i))/(360/TWO_PI))));
  }
}
