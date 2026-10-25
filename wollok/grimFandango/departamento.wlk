import agente.*

object departamento {
  
  const agentes = #{}
  var property paquetesPredefinidos = #{}
  method mejorAgente() = agentes.max({agente => agente.cantidadPaquetesVendidos()})

  method diaDeLosMuertos(){

    self.mejorAgente().reducirDeuda(50)
    agentes.filter({agente => agente.deuda() == 0}).forEach({agente => agente.liberar()})
    agentes.filter({agente => agente.deuda() != 0}).forEach({agente => agente.modificarDeduda(+100)})
  }

}