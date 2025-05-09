object cosas {
    
}

object knightRider {
  method peso() = 500  
  method peligrosidad() = 10 
  method bulto() = 1
  method consecuenciaDeCarga() {}
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
  method bulto() = 2
  method consecuenciaDeCarga() {self.transformar()}
}

object ladrillos {
  var property cantidad = 0
  method peligrosidad() = 2
  method peso() = 2 * cantidad 
  method bulto() = 
    if(cantidad <= 100) 1 
    else if(cantidad.between(101, 300)) 2
    else 3
  method consecuenciaDeCarga() {cantidad += 12}
}

object arena{
    var property peso = 0
    method peligrosidad() = 1
    method bulto() = 1
    method consecuenciaDeCarga() {peso = (peso - 10).max(0)}
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
    method bulto() = if (tieneMisiles)2 else 1  
    method consecuenciaDeCarga() {self.cargarMisiles()}
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
    method bulto() = 1 + contenido.sum({c => c.bulto()})
    method consecuenciaDeCarga() {contenido.forEach({c => c.consecuenciaDeCarga()})}

}

object residuos {
    var property peso = 0
    method peligrosidad() = 200 
    method bulto() = 1
    method consecuenciaDeCarga() {peso += 15}
}

object embalaje {
    var cosaEnvuelta = arena
    method envolver(unaCosa)  {cosaEnvuelta = unaCosa}
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
    method bulto() = 2
    method consecuenciaDeCarga() {}
    }