float x=0.01; 
float y=0; 
float z=0;

float sigma = 10; 
float roe = 28;
float beta = 8/3.0;

ArrayList<PVector> points = new ArrayList<PVector>();

float rotate = 0;
void setup(){
  size(800, 600, P3D);
  colorMode(HSB);
}

void draw(){
  background(0);
  float dt = 0.01; 
  float dx = (sigma*(y-x))*dt; 
  float dy = (x*(roe-z)-y)*dt; 
  float dz = (x*y-beta *z)*dt; 
  x = x + dx; 
  y = y + dy; 
  z = z + dz; 
  points.add(new PVector(x,y,z));
  //print(x, y, z);
  //rotateX(rotate); 
  translate(width/2, height/2);
  rotateY(rotate);
  rotate += 0.01;
  scale(5);
  stroke(255);
  noFill();
  beginShape();
  float hu = 0;
  for(PVector v: points){
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    hu += 0.1; 
    if(hu>255){
      hu = 0;
    }
  }
  endShape();
}