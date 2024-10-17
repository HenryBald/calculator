// Henry Baldwin | Calculator App | 30 Sept 24

Button[] buttons = new Button[24];
String dVal = "0";
float l, r, result;
char op;
int rb;
boolean left;


void setup() {
  size(420, 520);
  background(#393A3B);
  l = 0.0;
  r = 0.0;
  op = ' ';
  left = true;
  rb = int(random(0, 24));

  buttons[0] = new Button(50, 470, "0", 60, 60, true, false);
  buttons[1] = new Button(50, 470-4*20, "1", 60, 60, true, false);
  buttons[2] = new Button(50, 470-8*20, "4", 60, 60, true, false);
  buttons[3] = new Button(50, 470-12*20, "7", 60, 60, true, false);
  buttons[4] = new Button(50, 470-16*20, "C", 60, 60, false, false);
  buttons[5] = new Button(50+4*20, 470, ".", 60, 60, false, false);
  buttons[6] = new Button(50+4*20, 470-4*20, "2", 60, 60, true, false);
  buttons[7] = new Button(50+4*20, 470-8*20, "5", 60, 60, true, false);
  buttons[8] = new Button(50+4*20, 470-12*20, "8", 60, 60, true, false);
  buttons[9] = new Button(50+4*20, 470-16*20, "Del", 60, 60, false, false);
  buttons[10] = new Button(50+4*40, 470, "x!", 60, 60, false, false);
  buttons[11] = new Button(50+4*40, 470-4*20, "3", 60, 60, true, false);
  buttons[12] = new Button(50+4*40, 470-8*20, "6", 60, 60, true, false);
  buttons[13] = new Button(50+4*40, 470-12*20, "9", 60, 60, true, false);
  buttons[14] = new Button(50+4*40, 470-16*20, "±", 60, 60, false, false);
  buttons[15] = new Button(50+4*60, 470, "+", 60, 60, false, false);
  buttons[16] = new Button(50+4*60, 470-4*20, "-", 60, 60, false, false);
  buttons[17] = new Button(50+4*60, 470-8*20, "÷", 60, 60, false, false);
  buttons[18] = new Button(50+4*60, 470-12*20, "x", 60, 60, false, false);
  buttons[19] = new Button(50+4*60, 470-16*20, "√", 60, 60, false, false);
  buttons[20] = new Button(50+4*80, 470-40, "=", 60, 140, false, false);
  buttons[21] = new Button(50+4*80, 470-8*20, "π", 60, 60, true, false);
  buttons[22] = new Button(50+4*80, 470-12*20, "ND", 60, 60, false, true);
  buttons[23] = new Button(50+4*80, 470-16*20, "xʸ", 60, 60, false, false);
}

void draw() {
  background(#393A3B);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}


void updateDisplay() {
  fill(200);
  rectMode(CORNER);
  rect(20, 20, 380, 80);
  fill(0);
  textAlign(RIGHT);
  text(dVal, width-55, 70);
}

void mousePressed() {
  println("Left:" + l + "   Right:" + r + "   Result:" + result + "   Operator:" + op + " L:" + left);
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    }
    if (buttons[i].on == false && dVal.equals("0.0")) {
      dVal += buttons[i].val;
    } else if (buttons[i].on && buttons[i].n) {
      nerdInfect();
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      op = '+';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      // what do i do?
      if (op == '+') {
        result = l + r;
        dVal = str(result);
      } else if (op == '-') {
        result = l - r;
        dVal = str(result);
      } else if (op == 'x') {
        result = l * r;
        dVal = str(result);
      } else if (op == '÷') {
        result = l/r;
        dVal = str(result);
      }
    }
  }
}
void performCalculation() {
}

void nerdInfect () {
  rb = int(random(0, 24));
  if (buttons[rb].n == true) {
    nerdInfect();
  } else {
    buttons[rb].n = true;
  }
}
