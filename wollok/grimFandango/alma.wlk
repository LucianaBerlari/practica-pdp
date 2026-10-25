import paquete.*


class Alma {
  const dineroAlMorir
  const property cantidadAccionesBuena
  var tiempoDeViaje =4

  method modificarTiempoViaje(operacion) {
    tiempoDeViaje += operacion
    
  }

  method capital() = dineroAlMorir + cantidadAccionesBuena
  method puedeCostearlo (paquete) = paquete.costo(self) <= self.capital()
}

