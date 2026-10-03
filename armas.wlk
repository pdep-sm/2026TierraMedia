class Espada {
  const multiplicador
  const origen
  method poder() = multiplicador * origen.valor()
}

class Daga inherits Espada {
  override method poder() = super() / 2
}
class Baculo {
  const property poder
}
  
class Arco{
  const longitud
  var tension = 40

  method tension(nuevaTension){ // SOLO SETTER
      tension = nuevaTension
  }
  method poder() = tension * longitud * 0.1
}

class Hacha{
  const peso
  const largo
  method poder() = largo * peso
}


object elfico {
  method valor() = 25
}

object enano {
  const property valor = 20
}
object humano {
  const property valor = 15
}


