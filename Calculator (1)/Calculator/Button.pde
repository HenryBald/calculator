class Button {
  // Member variables: what is needed?
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum, n;
  PImage nerd, nerd2;

  // Constructor
  Button(int x, int y, String val, int w, int h, boolean isNum, boolean n) {
    this.x = x;
    this.y = y;
    c1 = color(#7989DE);
    c2 = color(#3B436F);
    this.val = val;
    this.w = w;
    this.h = h;
    on=false;
    this.n = n;
    imageMode(CENTER);
    nerd = loadImage("nerd.jpg");
    nerd.resize(w, h);
    nerd2 = loadImage("nerd2.png");
    nerd2.resize(w, h);
    this.isNum = isNum;
  }

  // Member methods
  void display() {
    if (n) {
    }
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }

    rectMode(CENTER);

    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(val, x, y);
    if (n) {
      image(nerd, x, y);
    }
  }

  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2 && (n == false)) {
      on = true;
      return on;
    } else if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2 && (n == true)) {
      image(nerd2, x, y);
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
