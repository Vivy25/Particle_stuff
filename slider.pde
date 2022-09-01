class Slider{

  int x0_line, x1_line, y0_line, y1_line, x_box, y_box, wdt, hgt;
  
  Slider(int x_init, int y_init, int x_final, int w, int h){
    x0_line = x_init;
    x1_line = x_final;
    y0_line = y_init;
    y1_line = y_init;
    x_box = (x1_line + x0_line)/2;
    y_box = y_init;
    wdt = w;
    hgt = h;
  }
  
  void display(){
    line(x0_line, y0_line, x1_line, y1_line);
    rectMode(CENTER);
    fill(255);
    rect(x_box, y_box, wdt, hgt);
  }
  
  void update(){
  
  }
  
}
