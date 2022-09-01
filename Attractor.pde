class Attractor{
  
  PVector loc;
  int state;
  
  Attractor(int x, int y, int st){
    state = st;
    loc = new PVector(x,y);
  }
  
  void show(){
    if(state == 1){
      fill(255,0,0,100);
      stroke(1);
      strokeWeight(1);
      ellipse(loc.x,loc.y,16,16);  
    }else{
      fill(0,0,255,100);
      stroke(1);
      strokeWeight(1);
      ellipse(loc.x,loc.y,16,16);  
    }
  }
  
}
