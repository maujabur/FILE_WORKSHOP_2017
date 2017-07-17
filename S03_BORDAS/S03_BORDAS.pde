void setup() {
  size(500, 500);
}

int y = 100;
int y_varia = 3;
int altura = 200;

void draw() {
  // desenha
  rect(50, y, 150, altura);

  // atualiza posição
  y = y+y_varia;

  if (y > height - altura) {
    y = height - altura;
    y_varia = - y_varia;
  }
  if (y < 0 ) {
    y = 0;
    y_varia = - y_varia;
  }
}