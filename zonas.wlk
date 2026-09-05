// Lebennin, Minas Tirith y Lossarnach
object lebennin {

    method esTransitablePor(guerrero) = guerrero.poder() > 1500
}

object minasTirith {

    method esTransitablePor(guerrero) = guerrero.tieneArmas()
}

object lossarnach {

    method esTransitablePor(guerrero) = true // :D 

}

object caminoDeGondor {
    const zonas = [lebennin, minasTirith]
    method esTransitablePor(guerrero) = 
        zonas.all{ zona => zona.esTransitablePor(guerrero) }

}