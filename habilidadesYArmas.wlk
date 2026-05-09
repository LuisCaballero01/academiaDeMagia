object luzLunar{
    var estaActivada = false
    method estaActivada() = estaActivada
    method alternar(){
        estaActivada = estaActivada.negate()
    }
}
object bastonDeFuego {
    method habilidadQueOtorga() = 60
}
object bastonDeHielo {
    method habilidadQueOtorga() = 40
}