class Objeto {
  int x, y;
  int y_v;
  int altura;

  void desenha() {
    rect(x, y, 150, altura);
  }

  void atualiza() {
    // atualiza posição
    y = y+y_v;

    if (y > height - altura) {
      y = height - altura;
      y_v = - y_v;
    }
    if (y < 0 ) {
      y = 0;
      y_v = - y_v;
    }
  }
}

Objeto obj1;

void setup() {
  size(500, 500);
  obj1 = new Objeto();
  obj1.x = 50;
  obj1.y = 100;
  obj1.y_v = 3;
  obj1.altura = 200;
}



void draw() {
  // desenha
  obj1.desenha();
  obj1.atualiza();
}