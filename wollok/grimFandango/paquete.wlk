import alma.*


class Paquete {
  const valorBasico
  method anosQueReduce(alma)
  
  method costo(alma) = (self.anosQueReduce(alma) * valorBasico).min(350)

}

class PaqueteTren inherits Paquete {
  
  override method anosQueReduce(_) = 4
}

class PaqueteBote inherits Paquete {
  
  override method anosQueReduce(alma) = (alma.cantidadAccionesBuena()/50).min(2) 
}

class PaqueteCrucero inherits PaqueteBote {
  
  override method anosQueReduce(alma) = super(alma)*2
}

class PaquetePaloConBrujula inherits Paquete {
  
  override method anosQueReduce(alma) = 0.05
  override method costo(_) = valorBasico
}