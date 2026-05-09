import habilidadesYArmas.*
import academia.*
object selene {
    var energia = 35
    var poder = 60
    const habilidad = luzLunar
    method alternarLuzLunar(){
        habilidad.alternar()
    }
    
    //metodos polimorficos
    method poder() = poder
    method energia() = energia
    method entrenar(){
        if (habilidad.estaActivada()) //Me gusta que comunique mejor que utilizando una variable con un bool.
            poder *= 2
        else
            energia += 25
    }
}


object balthazar {
    var cantHechizosDañinos = 0
    var horasEntrenamiento = 450
    
    //metodos polimorficos
    method poder() = 35 - (cantHechizosDañinos * 3)
    method energia() = horasEntrenamiento / 10
    method entrenar(){
        horasEntrenamiento += 100
        cantHechizosDañinos += 1
    }
}

object iris {
    var poderSanacion = 2

    method usarSanacion(){
        if (poderSanacion.odd()){
            academina.mejorarResistenciaEscudo(150)
            academina.mejorarDurabilidadEscudo(100)
        }
        else{
            academina.mejorarResistenciaEscudo(80)
            academina.mejorarDurabilidadEscudo(60)
        }
    }
    
    //metodos polimorficos
    method energia() = 80
    method poder() = 35
    method entrenar(){
        poderSanacion += 1
    }
}


object aldric {
    var bastonActual = bastonDeHielo
    var cantEntrenamientos = 0
    var habilidadConBastones = 30
    method cambiarBaston(unBaston){
        bastonActual = unBaston
    }

    //metodos polimorficos
    method energia() = 65 + (20 * cantEntrenamientos)
    method poder() = habilidadConBastones/2
    method entrenar(){
        habilidadConBastones += bastonActual.habilidadQueOtorga()
        cantEntrenamientos += 1
    }


}

