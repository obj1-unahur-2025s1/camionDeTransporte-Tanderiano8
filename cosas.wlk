object cosas {
    
}

object knightRider {
  method peso() = 500  
  method peligrosidad() = 10  
}
object bumblebee {  
  method peso() = 800  
  method peligrosidad() = 
  if(self.estaTransformado()){
    return 30
  }
  else {
    return 15
  }
  var estaTransformado = false   
  method transformar(){
    estaTransformado = not estaTransformado
  }
  method estaTransformado() = estaTransformado
}

object ladrillos {
    var property cantidad = 0
    method peligrosidad() = 2
    method peso() = 2 * cantidad 
}

object arena{
    var property peso = 0
    method peligrosidad() = 1
}

object bateriaAntiarea{
    var tieneMisiles = true
    method peso() = 
    if (tieneMisiles) 300 else 200
    method peligrosidad() =
    if (tieneMisiles) 100 else 0
    method cargarMisiles(){
        tieneMisiles = true
        }
    method descargarMisiles(){
        tieneMisiles = false
        }
}

object contenedor {
    const contenido = [] // new List()
    method peso() = 100 + contenido.sum({c => c.peso()})   
    method peligrosidad() = if (self.estaVacio()) 0 else contenido.max({c => c.peligrosidad()})
    method estaVacio() = contenido.isEmpty()
    method agregarObjeto(unObjeto) {
      contenido.add(unObjeto)
    }
    method borrarObjeto(unObjeto) {
      contenido.remove(unObjeto)
    }
    method agregarListaDeCosas(unaLista) {
      contenido.addAll(unaLista)
    }
    method vaciarListaDeCosas(unaLista) {
      contenido.clear()
    }

}

object residuos {
    var property peso = 0
    method peligrosidad() = 200 
}

object embalaje {
    var cosaEnvuelta = arena
    method envolver(unaCosa)  {cosaEnvuelta = unaCosa}
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
    }