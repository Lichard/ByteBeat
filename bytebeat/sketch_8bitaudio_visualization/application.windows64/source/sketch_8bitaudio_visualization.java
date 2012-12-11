import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_8bitaudio_visualization extends PApplet {



// 2D Array of objects
Cell[][] grid;
OscP5 oscP5;
NetAddress myRemoteLocation;
int cols = 16;
int rows = 16;
int curI=0, curJ=0;

public void setup() {
  size(displayWidth,displayHeight);
  frameRate(32);
  background(0);
  oscP5 = new OscP5(this, 6449);
  myRemoteLocation = new NetAddress("127.0.0.1", 6450);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*displayHeight/16+displayWidth/4,j*displayHeight/16,displayHeight/16,displayHeight/16,0);
    }
  }
}

public void oscEvent(OscMessage theOscMessage){
  int t = theOscMessage.get(0).intValue();
  t = (int)(t/256.0f*4+0.5f);
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
  
public void draw() {
  /*

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

  public void display() {
    stroke(val);
    fill(val);
    rect(x,y,w,h); 
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_8bitaudio_visualization" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
