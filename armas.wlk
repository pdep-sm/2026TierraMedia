/*
Espada: Cada espada tiene un multiplicador de poder entre 1 y 20,
 y además, como ya mencionamos, tiene su origen,
  que le otorga un valor extra.
   El poder de la espada se calcula como el producto entre el 
   multiplicador y el valor del origen. Repasando cada uno de los 
   valores de los orígenes:
Élfico: 30
Enano: 20
Humano: 15

*/
class Espada{
    const multiplicador
    const origen
    method poder() = multiplicador * origen.valor()
}
const glamdring = new Espada(multiplicador = 10 , origen = elfico)
class Baculo {
    const  property  poder
 
}
const baculo = new Baculo(poder = 400)
  
/*
Arco: Los arcos se fabrican con una tensión en 
kilogramos que es igual para todos 
(y que debería ser posible de cambiar) y un largo en cm, propio del arco.
La tensión se conoce inicialmente en 40kg. 
Y su poder se calcula como la décima parte del 
producto entre la tensión y su longitud

*/
class Arco{
    const longitud
    var  tension = 40

    method tension(nuevaTension){ // SOLO SETTER
        tension = nuevaTension
    }
    method poder() = tension * longitud * 0.1
}
/*
Hacha: El hacha 
está compuesta de un mango, y 
una hoja metálica con filo. 
Y se calcula como el largo del mango en cm 
multiplicado por el peso de la hoja en kg.

*/

class Hacha{
    const peso
    const largo
    method poder() = largo * peso
}


//const glamdring = fabricaDeEspadas.deOrigen(elfico)

object elfico {
  method valor() = 25
}

object enano {
  const property valor = 20
}
object humano {
  const property valor = 15
}




