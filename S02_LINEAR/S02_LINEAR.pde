void setup() {
  size(500, 500);
}

int y = 100;

void draw() {
  rect(50, y, 150, 200);
  // rect( x, y, largura, altura);
  
  y = y+3;
}