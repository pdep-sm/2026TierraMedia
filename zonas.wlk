class Zona {
  // const region  ??
  const requerimiento
  
  method esTransitablePor(grupo) = requerimiento.esCumplidoPor(grupo)

}

class RequerimientoItem {
  const cantidad
  const item

  method esCumplidoPor(grupo) = 
    self.totalDeItem(grupo) > cantidad

  method totalDeItem(grupo) = 
    grupo.sum{ guerrero => guerrero.cantidadDe(item) }

}

class RequerimientoGuerrero {
  const criterio
  // { g => g.tieneArmas()} // { g => g.poder() > 1500 }
   method esCumplidoPor(grupo) = 
    grupo.any{ guerrero => criterio.apply(guerrero) }
}

object noRequerimiento {
  method esCumplidoPor(grupo) = true
}

class Camino {
  const zonas
  method esTransitablePor(grupo) = 
    zonas.all{ zona => zona.esTransitablePor(grupo) }

}

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