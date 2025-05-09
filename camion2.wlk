object camion {
    const carga = []
    method pesoDeCarga() = carga.sum({c => c.peso()})
    method pesoTotal() = self.pesoDeCarga() + 1000
    method cargar(unaCosa) {
      carga.add(unaCosa)
      unaCosa.consecuenciaDeCarga()
    }
    method descargar(unaCosa) {
      carga.remove(unaCosa)
    }
    method cargarMasDeUna(lista) {
      carga.addAll(lista)
      lista.forEach({c => c.consecuenciaDeCarga()})
    }
    method todoPesopar() = carga.all({c => c.peso().even()})// even->par / odd->impar
    method hayAlgoQuePesa(unValor) = carga.any({c => c.peso() == unValor })
    method primeroConPeligrosidad(unNivel) = carga.find({c => c.peligrosidad() >= unNivel}) 
    method cosasQueSuperanPeligrosidad(unNivel) = carga.filter({c => c.peligrosidad() > unNivel}) 
    method cosasMasPeligrosasQue(unaCosa) = self.cosasQueSuperanPeligrosidad(unaCosa.peligrosidad())
    method camionExcedidoDePeso() = self.pesoTotal() > 2500
    method puedeCircular(unValor) = not self.camionExcedidoDePeso() and self.cosasQueSuperanPeligrosidad(unValor).isEmpty()      
    method tieneAlgoQuePesaEntre(min,max) = carga.any({c=>c.peso().between(min, max)}) 
    method cosaMasPesada() = carga.max({c => c.peso()})

}