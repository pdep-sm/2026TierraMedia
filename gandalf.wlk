object gandalf {
  var vida = 100
  const armas = []

  method vida(nuevaVida) {
    vida = nuevaVida
  }

  method poder() {
    const multiplicador = if (vida >= 10) 15 else 300
    return vida * multiplicador + self.poderDeArmas() * 2  
  }

  method agregarArma(arma) {
    armas.add(arma)
  }

  method poderDeArmas() = armas.sum{ arma => arma.poder() }

  method tieneArmas() = not armas.isEmpty()

  method puedeAtravesar(lugar) = lugar.esTransitablePor(self)
 
}

object baculo {
  method poder() = 400
}
/*
object glamdring {
  var property origen = elfico

  method poder() = 10 * origen.valor()
}
*/
object fabricaDeEspadas { //Factory (no estudiar => Diseño de Sistemas)
  method deOrigen(origen) = object {
    method poder() = 10 * origen.valor()
  }
}
const glamdring = fabricaDeEspadas.deOrigen(elfico)

object elfico {
  method valor() = 25
}

object enano {
  const property valor = 20
}
object humano {
  const property valor = 15
}




