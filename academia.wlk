import magos.*
object academina {
    const equipo = []
    const candidadatos = []
    var resistenciaEscudo = 400
    var durabilidadEscudo = 600

    method resistenciaEscudo() = resistenciaEscudo
    method durabilidadEscudo() = durabilidadEscudo
    method mejorarResistenciaEscudo(cantidad){
        resistenciaEscudo += cantidad
    }
    method mejorarDurabilidadEscudo(cantidad){
        durabilidadEscudo = (durabilidadEscudo + cantidad).min(1000)
    }

    method sacarMagoDelEquipo(unMago){
        equipo.remove(unMago)
    }
    method reclutarMago(unMago){
        if (self.superaEvaluacion(unMago)){
            candidadatos.remove(unMago)
            equipo.add(unMago)
        }
        else{
            candidadatos.add(unMago)
        }
    }
    method superaEvaluacion(unMago){
        return (unMago.energia()>40).and(unMago.poder()>30)
    }
    method entrenarMagos(){
        equipo.forEach({m => m.entrenar()})
    }
    method entrenarCandidato(unMago){
        if(self.esCandidato(unMago)){
            unMago.entrenar()
        }
    }
    method esCandidato(unMago){
        return (candidadatos.contains(unMago))
    }
    method esDelEquipo(unMago){
        return equipo.contains(unMago)
    }
    
    method reevaluarCandidatos(){
        candidadatos.forEach({m => self.reclutarMago(m)})
    }

    method poderDelEquipo(){
        return equipo.sum({m => m.poder()})
    }
    method equipoOptimo(){
        return equipo.all({m => m.energia() >= 45})
    }
    method deltaDeEnergia(){
        return (self.magoMasPoderoso().poder() - self.magoMasDebil().poder()).abs()
    }
    method magoMasDebil(){
        return equipo.min({m => m.poder()})
    }
    method magoMasPoderoso(){
        return equipo.max({m => m.poder()})
    }

    method poderesDeMagosConEnergiaAlta(){
        return self.magosConEnergiaAlta().map({m => m.poder()})
    }
    method magosConEnergiaAlta(){
        return equipo.filter({m => m.energia() > 90})
    }

}