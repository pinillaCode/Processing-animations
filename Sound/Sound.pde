import processing.sound.*;

FFT fft;
SoundFile file;
int bands = 16;
float[] spectrum = new float[bands];
PShape[] barra = new PShape[bands*2];
float[] angle_i = new float[bands*2];
float h;
int amp=20;


void setup() {
  size(600, 600);
  background(0);

  fft = new FFT(this, bands*2);
  file = new SoundFile(this, "Ignite.mp3");
  file.play();
  fft.input(file);
  for(int i=0;i<bands;i++)
  {
    barra[i] = createShape(RECT,0,100,5,100,2);
    barra[i].setFill(color(i*int(255/bands),255,255));
    angle_i[i]=(((i*TWO_PI/(bands*2)))*0.7)+(1);
    barra[i].rotate(angle_i[i]);
    barra[i].noStroke();
    barra[i+bands] = createShape(RECT,0,100,5,100,2);
    barra[i+bands].setFill(color(i*int(255/bands),255,255));
    barra[i+bands].rotate(-angle_i[i]);
  }
}      

void draw() { 
  background(0);
  fft.analyze(spectrum);

  for(int i=0;i<bands;i++)
  {
    h=spectrum[i]*amp;
    shape(barra[i],300-(20*h*sin(angle_i[i])),300+(20*h*cos(angle_i[i])));
    shape(barra[i+bands],300-(20*h*sin(-angle_i[i])),300+(20*h*cos(-angle_i[i])));
    rect(10,500,(file.position()/file.duration())*580,10);
  }
}

void mousePressed()
{
  file.jump(10+file.position());
}
