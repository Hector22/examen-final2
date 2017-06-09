
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Box2DProcessing box2d;


ArrayList<Boundary> boundaries;

ArrayList<Box> boxes;
boolean presionandoArriba = false; 
  boolean presionandoAbajo = false;;
  int posicionBarraJugador = 100;
void setup() {
  size(640,360);
  smooth();
  

  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box2d.setGravity(0, -30);

  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
 
  boundaries.add(new Boundary(100,360,25,400));
  boundaries.add(new Boundary(125,360,25,400));
  boundaries.add(new Boundary(150,360,25,400));
  boundaries.add(new Boundary(175,360,25,400));
  boundaries.add(new Boundary(200,360,25,400));
  boundaries.add(new Boundary(225,360,25,400));
  boundaries.add(new Boundary(275,360,25,400));
  boundaries.add(new Boundary(250,360,25,400));
  boundaries.add(new Boundary(300,360,25,400));
  boundaries.add(new Boundary(325,360,25,400));
  boundaries.add(new Boundary(350,360,25,400));
  boundaries.add(new Boundary(375,360,25,400));
  boundaries.add(new Boundary(400,360,25,400));
  boundaries.add(new Boundary(425,360,25,400));
  boundaries.add(new Boundary(450,360,25,400));
  boundaries.add(new Boundary(475,360,25,400));
  boundaries.add(new Boundary(500,360,25,400));
  boundaries.add(new Boundary(525,360,25,400));
  boundaries.add(new Boundary(550,360,25,400));

}

void draw() {
  background(255);

  //boundaries.add(new Boundary(250,mouseY,25,400));



  // We must always step through time!
  box2d.step();

  // Boxes fall from the top every so often
  if (mousePressed) {
    Box p = new Box(width/2,30);
    boxes.add(p);
  }

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}