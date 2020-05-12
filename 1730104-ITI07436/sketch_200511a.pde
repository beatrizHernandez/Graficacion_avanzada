import java.util.List;
Circulo tmp, tmp1;
List <Circulo> lista; // <> Operador Diamante
String q="";
float x, y;
int n=-1; // para el id del circulo
int k = 30; // numero de circulos en la lista
int w =0; //id inicial del circulo

void setup(){
    size(600, 600); //dimension de la pantalla
    lista = new <Circulo> ArrayList(); //Lista de circulos
    tmp = null;
    tmp1 = null;
    for(int i=0; i < k ;i++){ //se repite hasta el valor de la variable (k: cantidad de circulos deseados)
       x = random(width); //posicion en x random dependiendo del ancho de la pantalla
       y = random(height); //posicion en y random dependiendo de la altura de la pantalla
       tmp = new Circulo(x, y, 50, w); //creacion del circulo (id) 
       w++; //incremento de id
       lista.add(tmp); //Agregar circulo a la lista de circulos
    }
}

void draw(){
   background(#FFFFFF); //color del fondo de la pantalla
   for(int i = 0; i < lista.size() ;i++){ //se repite hasta el numero total de elementos dentro de la lista de circulos
       tmp = lista.get(i); //obtiene el id de la lista
       tmp.dibuja(); //tmp manda a llamar funcion de la clase Circulo
   }
   textSize(24); 
   fill(255); //color del circulo (RGB)
}

void mousePressed(){
  q="";
   for(int i = lista.size()-1; i >= 0; i--){ //valida el valor del circulo al ir en decremento 
          tmp1 = lista.get(i); //obtiene el id de la lista pero haciendo referencia al evento Click y no al Draw
          if (tmp1.isAdentro(mouseX, mouseY) ) { //si las coordenadas del mouse se encuentran dentro de las dimensiones del circulo
             n = tmp1.id; //asigna valor del id del circulo seleccionado
             //q += tmp1.id; 
             tmp.mover = true; //hace referencia a la bandera de movimiento dentro de la clase Circulo
             break;
          }
   }

}

void mouseDragged(){
  if (n != -1){ //si el id del circulo es diferente de -1 entonces
  println("mouse x" + mouseX + "mouseY" + mouseY);
  println("Circulo X" + tmp1.x + " Ciruclo Y " + tmp1.y);
  tmp1.x = mouseX; //se igualan valores de coordenadas del mouse con el circulo en X
  tmp1.y = mouseY; //se igualan valores de coordenadas del mouse con el circulo en Y
  }
}

void mouseReleased(){
   q = "";
   n = -1; // no se está seleccionando nigún círculo.
   tmp1.mover = false;
   tmp1 = null; //se elimina, NO SE REINICIA!
}
