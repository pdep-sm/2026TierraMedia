import armas.*
import zonas.*

/* Hobbits: Los hobbits son 
la raza mediana del lugar.
 No representan una gran amenaza y 
 su cálculo de poder está dado por 
 la siguiente fórmula:
vida actual + (sumatoria del poder de sus armas)
 + cantidad de ítems
*/
class Hobbit {
    var  property  vida
    const items = []
    const armas = []
    
    method poder() = vida + self.poderDeArmas() + self.cantidadItems()

    method cantidadItems() = items.length()
    
    method puedeAtravesar(lugar) {
      
    }
    method atravesar(lugar) {
      
    }
    method poderDeArmas() = armas.sum{ arma => arma.poder() }
}

/*
Enanos: Los Enanos suelen tener armas muy poderosas, 
por lo tanto su poder es:
vida actual + factor de poder * (sumatoria del poder de sus armas)
El factor de poder, es un número que depende de cada enano.
*/
class Enano {
    var  property  vida
    const armas = []
    const factorDePoder

    method poder() = vida + self.poderDeArmas() * factorDePoder

    
    method puedeAtravesar(lugar) {
      
    }
    method atravesar(lugar) {
    }

    method poderDeArmas() = armas.sum{ arma => arma.poder() }

}

/*Elfos: Una de las características de los elfos es su destreza, 
representada por un número. Por este motivo es que debemos 
considerarla a la hora de calcular su poder:
vida actual + (sumatoria del poder de sus armas) * 
(destrezaBase + destrezaPropia)
La destreza base, es común para todos los elfos y puede cambiar. 
Hoy en día es de 2.

*/
object elfo { // WKO COMPANION OBJECT -> cosas comunes al elfo
  var property destrezaBase = 2
}
class Elfo {
    var  property  vida
    const armas = []
    const destreza

    method poder() = vida + self.poderDeArmas() *  self.destrezaTotal()

    method destrezaTotal() = elfo.destrezaBase() + destreza

    method puedeAtravesar(lugar) {
      
    }
    method atravesar(lugar) {
    }

    method poderDeArmas() = armas.sum{ arma => arma.poder() }

}

/*Humanos: Probablemente, 
la raza más común, pero no por eso la menos importante. 
Su cálculo de poder está dado por:
vida actual * (sumatoria del poder de sus armas) / Limitador de Poder
El limitador de poder es particular para cada Humano.
*/
class Humano {
    var  property  vida
    const armas = []
    const limitadorDePoder

    method poder() = vida * self.poderDeArmas() / limitadorDePoder


    method puedeAtravesar(lugar) {
      
    }
    method atravesar(lugar) {
    }

    method poderDeArmas() = armas.sum{ arma => arma.poder() }

}
/*
Maiar: Gandalf es un Maia, y 
la forma en la cual calcula su
 poder representa a todos los de su misma raza. 
 Los valores de 15 y 300 son factores de poder básico y 
 poder bajo amenaza, respectivamente, que dependen de todos los Maiar.
  Hay que tener en cuenta que podrían llegar a cambiar, 
  aplicando el cambio para todos ellos por igual.
vida actual * factor actual + (sumatoria del poder de sus armas) * 2

*/
object maia {
  var property poderBasico = 15
  var property poderBajoAmenaza = 300
}

class Maia {
  var property vida = 100
  const armas = []

  method modificarVida(numero) {
    vida += numero
  }

  method poder() {
    const multiplicador = if (vida >= 10) maia.poderBasico() else maia.poderBajoAmenaza()
    return vida * multiplicador + self.poderDeArmas() * 2  
  }
  
  method agregarArma(arma) {
    armas.add(arma)
  }

  method poderDeArmas() = armas.sum{ arma => arma.poder() }

  method tieneArmas() = not armas.isEmpty()

  method puedeAtravesar(lugar) = lugar.esTransitablePor(self)

  method atravesar(lugar) {
    if (self.puedeAtravesar(lugar))
      lugar.esTransitadoPor(self)
    //TODO Continua en otra clase.....
  }
 
}
/*
Tom Bombadil: Tom sigue igual... 
Si bien es un guerrero más, 
no pertenece a ninguna raza en particular. 
El poder de Tom es fijo y vale diez millones.*/
object tomBombadil {
    method puedeAtravesar(lugar) = true
    
    method atravesar(lugar) {
    }
    method poder() = 10000000
}
