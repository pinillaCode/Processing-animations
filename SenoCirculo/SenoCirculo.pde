PShape[] barra = new PShape[30];
float ang=0;
float ang_i;
float h;

void setup() {
  size(600, 600);
  for(int i=0;i<barra.length;i++)
  {
    barra[i] = createShape(RECT,0,100,10,100,5);
    barra[i].setFill(color(i*int(255/barra.length),255,255));
    barra[i].rotate(i*TWO_PI/barra.length);
    barra[i].noStroke();
  }
  frameRate(60);
}

void draw() {
  ang+=5;
  background(0);
  for(int i=0;i<barra.length;i++)
  {
    ang_i=i*TWO_PI/barra.length;
    h=cos((ang_i*barra.length/3)+(ang/60));
    shape(barra[i],300-(20*h*sin(ang_i)),300+(20*h*cos(ang_i)));
  }
}
