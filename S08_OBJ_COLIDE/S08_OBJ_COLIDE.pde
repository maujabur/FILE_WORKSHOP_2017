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

  boolean colidiu(Bloco outro) {
    boolean lado_x1 = (x+largura > outro.x);
    boolean lado_x2 = (outro.x + outro.largura > x);

    boolean lado_y1 = (y+altura > outro.y);
    boolean lado_y2 = (outro.y + outro.altura > y);

    return lado_x1 && lado_x2 && lado_y1 && lado_y2;
  }
}

Bloco bola;
Bloco esq, dir;


void setup() {
  size(500, 500);

  bola = new Bloco(200, 0, 40, 40, 2, 3, color(255));

  esq = new Bloco(20, 0, 25, 100, 0, 0, color(255, 0, 0));
  dir = new Bloco(width-20-25, 0, 25, 100, 0, 5, color(0, 0, 255));
}

void draw() {
  background(50); // com um argumento só, gera tons de cinza

  // controle pelo mouse
  int y_pos = constrain(mouseY, 0, height-esq.altura);
  esq.y = y_pos;

  // atualiza
  bola.atualiza();
  dir.atualiza();

  // melhorar
  if (bola.colidiu(esq)) 
  {
    bola.x = esq.x+esq.largura;
    bola.x_v = abs(bola.x_v);
  }
  if (bola.colidiu(dir)) { 
    bola.x = dir.x - bola.largura;
    bola.x_v = -abs(bola.x_v);
  }
  // desenha
  bola.desenha();
  esq.desenha();
  dir.desenha();
}