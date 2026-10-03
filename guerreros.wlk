import armas.*
import zonas.*

class Guerrero {
  const armas = []
  const property items = []
  method agregarArma(arma) {
    armas.add(arma)
  }

  method poder()
  
  method tieneArmas() = not armas.isEmpty()

  method poderDeArmas() = armas.sum{ arma => arma.poder() }

  method cantidadDe(_item) = items.count{ item => item == _item }

  method puedeAtravesar(lugar) = lugar.esTransitablePor(self)

  method atravesar(lugar) {
    if (self.puedeAtravesar(lugar))
      lugar.esTransitadoPor(self)
    //TODO Continua en otra clase.....
  }
}
class Hobbit inherits Guerrero {
    var property vida
    
    override method poder() = vida + self.poderDeArmas() + self.cantidadItems()

    method cantidadItems() = items.length()
  
    
}

object gollum inherits Hobbit(vida = 100) {
  override method poder() = super() / 2
}

class Enano inherits Guerrero {
    var  property  vida
    const factorDePoder

    override method poder() = vida + self.poderDeArmas() * factorDePoder

}

object elfo { // WKO COMPANION OBJECT -> cosas comunes al elfo
  var property destrezaBase = 2
}
class Elfo inherits Guerrero {
    var  property  vida
    const destreza

    override method poder() = vida + self.poderDeArmas() *  self.destrezaTotal()

    method destrezaTotal() = elfo.destrezaBase() + destreza

}

class Humano inherits Guerrero {
    var  property  vida
    const limitadorDePoder

    override method poder() = vida * self.poderDeArmas() / limitadorDePoder

}

object maia {
  var property poderBasico = 15
  var property poderBajoAmenaza = 300
}

class Maia inherits Guerrero {
  var property vida = 100
  method modificarVida(numero) {
    vida += numero
  }

  override method poder() {
    const multiplicador = if (vida >= 10) maia.poderBasico() else maia.poderBajoAmenaza()
    return vida * multiplicador + self.poderDeArmas() * 2  
  }
 
}
object tomBombadil {
    method puedeAtravesar(lugar) = true
    
    method atravesar(lugar) {
    }
    
    method poder() = 10000000
}
