import oscP5.*;
import netP5.*;
// 2D Array of objects
Cell[][] grid;
OscP5 oscP5;
NetAddress myRemoteLocation;
int cols = 16;
int rows = 16;
int curI=0, curJ=0;

void setup() {
  size(700,700);
  oscP5 = new OscP5(this, 6449);
  myRemoteLocation = new NetAddress("127.0.0.1", 6450);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*700/16,j*700/16,700/16,700/16,0);
    }
  }
}

void oscEvent(OscMessage theOscMessage){
  int t = theOscMessage.get(0).intValue();
  t = (int)(t/256.0*4+0.5);
  t*=256/4;
  grid[curI][curJ].val=t;
  curI=(curI+1)%16;
  if(curI==0)
    curJ=(curJ+1)%16;
   if(curI==0&&curJ==0){
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          grid[i][j].display();
        }  
       }
     }
}
  
void draw() {
  /*
  background(0);
  if(true){
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j].display();
      }
    }
  }*/
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float val; // brightness value

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempVal) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
  } 

  void display() {
    stroke(val);
    fill(val);
    rect(x,y,w,h); 
  }
}
