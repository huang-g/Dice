Die stamp = new Die();
int sum = 0;
PFont courier;
int[] counts = new int[6];

void setup() {
  size(520,700);
  noLoop();
  courier = createFont("Courier New", 14);
}


void draw() {
  noStroke();
  fill(192);
  rect(0,0,520,700);
  for(int j = 100; j <= 385; j += 65) {
    stamp.y = j;
    for(int i = 100; i <= 385; i += 65) {
      stamp.x = i;
      if (i != 230 || j != 230) {
        stamp.show();
        sum += stamp.n;
        resultCounter(stamp.n);
      } else {
        fill(0);
        rect(i, j, 60,60,7);
      }
      stamp.roll();
    }
  }// end of dice grid
  textAlign(CENTER);
  textFont(courier);
  fill(255);
  text(sum, 260, 265);
  resultGraph(620);
}

void mousePressed() {
  redraw();
  sum = 0;
  for(int i = 0; i < counts.length; i++){
    counts[i] = 0;
  }
  
}

class Die {
  int x, y, n;
  Die() {
    n = (int)(Math.random()*6 +1);
    x = 100;
    y = 100;
  }
  
  void roll() {
    n = (int)(Math.random()*6+1);
  }
  
  void show() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y, 60, 60, 7);
    fill(0);
    if (n%2 == 1) {
      ellipse(x+30, y+30, 10,10);
      if (n >= 3) {
        ellipse(x+15, y+45, 10, 10);
        ellipse(x+45, y+15, 10, 10);
        if (n == 5) {
          ellipse(x+15, y+15, 10, 10);
          ellipse(x+45, y+45, 10, 10);
        }
      }
    } else if(n%2 == 0) {
      ellipse(x+15, y+15, 10, 10);
      ellipse(x+45, y+45, 10, 10);
      if (n >= 4) {
        ellipse(x+15, y+45, 10, 10);
        ellipse(x+45, y+15, 10, 10);
        if (n == 6) {
          ellipse(x+15, y+30, 10, 10);
          ellipse(x+45, y+30, 10, 10);
        }
      }
    } //end of dot drawings
  } //end of show()
} //end of Die class

void resultGraph(int ylev) {
  textAlign(CENTER);
  strokeWeight(3);
  line(100, ylev, 420, ylev);
  for(int i = 1; i <= 6; i++) {
    noStroke();
    fill(0);
    rect(100 + i*40, ylev - counts[i-1]*15, 35, counts[i-1]*15); //graph bars
    stroke(255);
    strokeWeight(1);
    fill(255);
    textSize(10);
    text(counts[i-1], 100 + i*40 + 35/2, ylev - counts[i-1]*15 + 10); //bar counts
    stroke(0);
    fill(0);
    textSize(14);
    text(i, 100 + i*40 + 35/2, ylev+15); //bar labels
  }
}

void resultCounter(int n) {
  if(n == 1)
    counts[0]++;
  else if (n == 2)
    counts[1]++;
  else if (n == 3)
    counts[2]++;
  else if (n == 4)
    counts[3]++;
  else if (n == 5)
    counts[4]++;
  else if (n == 6)
    counts[5]++;
}
