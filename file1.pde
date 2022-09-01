int part_num = 1;

Slider sld = new Slider(25, 25, 25 + 150, 20, 20);

ArrayList<Particle> part = new ArrayList<Particle>();
ArrayList<Attractor> at = new ArrayList<Attractor>();
PVector location;
int attractor_length = 0;

//Creating Attraction Object when left mouse button is pressed, else Repulsion Object with right mouse button 
void mousePressed(){
  if(mouseButton == LEFT && (mouseY > 50) && mouse_at() == false){
    at.add(new Attractor(mouseX,mouseY,1));
  }else if(mouseButton == RIGHT && (mouseY > 50) && mouse_at() == false){
    at.add(new Attractor(mouseX,mouseY,0));
  }else if(mouseButton == LEFT && mouse_at()){
    //highlight();
    //update_slider
    println("HI");
  }
}

void setup(){
  size(640,640);
  //fullScreen();
  for(int i = 0; i < part_num; i++){
    part.add(new Particle(random(50, width-50), random(50,height-50)));
  }
}

void draw(){
  background(255);
  //Everytime a mouse button is pressed an attractor object is created and shown
  for(Attractor attr : at){
    attr.show();
  }
  
  //looping thru each particle to update forces,velocity,postion and display each
  for(Particle pt : part){
    for(int j = 0; j < at.size(); j++){
      pt.attraction(at.get(j).loc, at.get(j).state);
    }
    pt.update();
    pt.show();
  }
  sld.display();
  txt();
}

Boolean mouse_at(){
  for(Attractor a : at){
    println(at.size());
    if(dist(mouseX, mouseY, a.loc.x, a.loc.y) <= 16){
      return true;
    }else{
      return false;
    }
  }
  return false;
}

void txt(){
  fill(0);
  textSize(20);
  text("Particle", width/2 - 20, 25);
  text("ForceG", width/2 + 130, 25);
  text(part.size(), width/2 + 50, 25);
  text(at.size(), width/2 + 200, 25);
  text(frameRate, width/2 + 250, 25);
  noFill();
}
