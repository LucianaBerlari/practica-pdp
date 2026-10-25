import alma.*
import paquete.*
import departamento.*
class AgentesDeViaje {
  var property deuda
  // con esto ya puedo conocer la deuda de un agente, no se si corresponde un metodo
  var property estrategia
  var property paquetesVendidos = []
  var property costoPaquetesVendidos = []

  
  method cantidadPaquetesVendidos() = paquetesVendidos.size()
  
  // FALTA CAMBIARRR
  method dineroGanado() = costoPaquetesVendidos.sum()

  method modificarDeuda(operacion) {
    deuda += operacion
  }

  method venderPaquete(alma, paquete) {

       if(alma.puedeCostearlo(paquete)){
        self.modificarDeuda(-paquete.costo(alma))
        alma.modificarTiempoViaje(-paquete.anosQueReduce(alma))
        self.costoPaquetesVendidos().add(paquete.costo(alma))
         self.paquetesVendidos().add(paquete)
    }
    
  }
  
  method atenderAlma(alma) {
    const paquete = estrategia.armarPaquete(alma)
    self.venderPaquete(alma, paquete)
  }
  
  method cambiarEstaregia(estrategiaNueva) {
    estrategia = estrategiaNueva
  }

  method liberar() {
    
  }
}

object clasico {
  method armarPaquete(alma) =  departamento.paquetesPredefinidos().filter({paquete => alma.puedeCostearlo(paquete)}).max({paquete => paquete.costo()})
}

object navegante {

  method armarPaquete(alma) {
    if(alma.cantidadAccionesBuena()>50){
        const crucero = new PaqueteCrucero(valorBasico = alma.cantidadAccionesBuena())
        return crucero
    }else{
        const bote = new PaqueteBote(valorBasico = alma.cantidadAccionesBuena())
        return bote
    }
  }
}

object indiferente {
  method armarPaquete(alma) = new PaquetePaloConBrujula(valorBasico= 1.randomUpTo(300))

}