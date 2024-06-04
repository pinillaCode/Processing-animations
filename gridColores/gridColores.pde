int w=300;
int h=200;
int[][]  cells = new int[w][200];
int y=0;

void setup() {  
  windowResize(w*3,h*3);
  frameRate(1);
}

void draw() {
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      
      fill((float(i)/w)*255,,random(255));
      rect(i*3,j*3,3,3);
    }
  }
  y++;
}
