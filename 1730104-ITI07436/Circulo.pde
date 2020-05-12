class Circulo{
  float x;
  float y;
  float diametro;
  int id;
  boolean mover;
 
  Circulo(float a, float b, float c, int d){
     x = a;
     y = b;
     diametro = c;
     id = d;
     ellipseMode(CENTER); //Modo del circulo (control de tamaño)
     mover = false;
  }

void dibuja(){ //funcion de dibujado del circulo
   fill(#000000);
   ellipse(x, y, diametro, diametro);
   fill(#FFFFFF);
   text(id, x, y);
}

boolean isAdentro(float a, float b){ //comparacion de la posicion del mouse respecto al circulo
   if( dist(a, b, x, y) < diametro/2){ //solo entra si el mouse está tocando el circulo
     println("Adentro del circulo retorno de un true");
         return true;
   }else
         return false;
  }
}
