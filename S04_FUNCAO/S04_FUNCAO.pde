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

void setup() {
  size(500, 500);
  x = 50;
  y = 100;
  y_v = 3;
  altura = 200;
}



void draw() {
  // desenha
  desenha();
  
  //atualiza
  atualiza();
}