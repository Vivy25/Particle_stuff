class Particle{
  
  PVector pos;
  PVector velocity;
  PVector acc;
  PVector force;
  float dSqr;
  float G = -7;
  float mag;
  int sz = 4;
  
  //ArrayList<PVector> history = new ArrayList<PVector>();
  
  Particle(float x, float y){
    pos = new PVector(x,y);
    velocity = new PVector(random(-1,1),random(-1,1));
    acc = new PVector();
  }
  
  void boundary(){
    if(((pos.x - sz) < 0) || ((pos.x + sz) > width)){
      velocity.x *= -1;
    }
    
    if(((pos.y + sz) <= 50) || ((pos.y + sz) > height)){
      velocity.y *= -1;
    }
  }
  
  void attraction(PVector lc, int st){
    
    if(st == 1){
      force = PVector.sub(pos, lc);
      dSqr  = force.magSq();
      dSqr  = constrain(dSqr,50,width);
      mag   = G/dSqr;
      force.setMag(mag);
      acc   = acc.add(force);
    }else if(st == 0){
      force = PVector.sub(pos, lc);
      dSqr  = force.magSq();
      dSqr  = constrain(dSqr,50,width);
      mag   = G/dSqr;
      force.mult(-1);
      force.setMag(mag);
      acc   = acc.add(force);
    }
  }
  
  void update(){
  pos.add(velocity);
  velocity.add(acc);
  acc.mult(0);
  boundary();
  //history.add(new PVector(this.pos.x, this.pos.y));
  //if(history.size() >= 50){
  //  history.remove(0);
  //}
  //println(history.size());
  }
  
  void show(){
    noFill();
    ellipse(pos.x, pos.y, sz, sz);
    
    //beginShape();
    //for(PVector ps : history){
    //  vertex(ps.x, ps.y);
    //}
    //endShape();
  }
}
