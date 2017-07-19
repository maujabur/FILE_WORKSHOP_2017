class Bloco {
  int x, y;
  int x_v, y_v;
  int largura, altura;
  color c;

  Bloco(int xi, int yi, int li, int ai, int x_vi, int y_vi, color ci) {
    x = xi;
    y = yi;
    largura = li;
    altura = ai;
    x_v = x_vi;
    y_v = y_vi;
    c = ci;
  }

  void desenha() {
    fill(c);
    rect(x, y, largura, altura);
  }

  void atualiza() {    
    x = x + x_v;
    y = y + y_v;

    // reflete x
    if (x > width - largura) {
      x = width - largura;
      x_v = - x_v;
    } // fim do if
    if (x < 0 ) {
      x = 0;
      x_v = - x_v;
    } // fim do if

    // reflete y
    if (y > height - altura) {
      y = height - altura;
      y_v = - y_v;
    } // fim do if
    if (y < 0 ) {
      y = 0;
      y_v = - y_v;
    } // fim do if
  } // fim do atualiza
}

Bloco obj1, obj2;

void setup() {
  size(500, 500);
    
  obj1 = new Bloco(20, 200, 25, 100, 0, 0, color(255, 0, 0));
  obj2 = new Bloco(width-20-25, 0, 25, 100, 0, 5, color(0, 0, 255));
}

void draw() {
  background(50); // com um argumento só, gera tons de cinza

  // controle pelo mouse
  int y_pos = constrain(mouseY, 0, height-obj1.altura);
  obj1.y = y_pos;

  // atualiza
  obj2.atualiza();

  // desenha
  obj1.desenha();
  obj2.desenha();
}