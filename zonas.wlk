// Lebennin, Minas Tirith y Lossarnach
object lebennin {

  method esTransitablePor(guerrero) = guerrero.poder() > 1500

  method esTransitadoPor(guerrero) {
  }
}

object minasTirith {

  method esTransitablePor(guerrero) = guerrero.tieneArmas()

  method esTransitadoPor(guerrero) {
    guerrero.modificarVida(-10)
  }
}

object lossarnach {

  method esTransitablePor(guerrero) = true // :D 

  method esTransitadoPor(guerrero) {
    guerrero.modificarVida(1)
  }

}

object caminoDeGondor {
  const zonas = [lebennin, minasTirith]
  method esTransitablePor(guerrero) = 
    zonas.all{ zona => zona.esTransitablePor(guerrero) }

  method esTransitadoPor(guerrero) {
    zonas.forEach{ zona => zona.esTransitadoPor(guerrero) }
  }

}