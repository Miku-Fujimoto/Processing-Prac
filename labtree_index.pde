int n = 60;
int[] x = new int[n];
int[] y = new int[n];
int[] d = new int[n];
int[] vx = new int[n];
int[] vy = new int[n];
color[] c = new color[n];

void setup() {
  fullScreen(0);
  for (int i = 0; i < x.length; i++) {
  d[i] = (int)random(2, 20);
  x[i] = (int)random(d[i] / 3, width - d[i] / 3);
  y[i] = (int)random(d[i] / 3, height - d[i] / 3);
  for (;vx[i] == 0;) vx[i] = (int)random(-5, 5);
  for (;vy[i] == 0;) vy[i] = (int)random(-5, 5);
  c[i] = color(243,202,82);
  }
}

void draw() {
  textSize(10);
  background(255, 255, 255);
  for (int i = 0; i < x.length; i++) {
    pingpong(i);
    fill(c[i]);
    stroke(255);
    ellipse(x[i], y[i], d[i], d[i]);
    connect(i);
  }
}

void pingpong(int i) {
  if (x[i] >= width - d[i] / 2 || x[i] <= d[i] / 2)
  vx[i] = -vx[i];
  if (y[i] >= height - d[i] / 2 || y[i] <= d[i] / 2)
  vy[i] = -vy[i];
  x[i] += vx[i];
  y[i] +=vy[i];
} 


void connect(int i) {
  stroke(c[i]);
  for (int j = 0; j < n; j++) {
    if (i != j && i < j) {
    if (dist(x[i], y[i], x[j], y[j]) <= 100)
    line(x[i], y[i], x[j], y[j]);
    }
  }
}
