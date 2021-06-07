import rodados.*

class Pedido {
	var property distancia
	var property tiempoMaximo
	var property cantidadPasajeros
	var property coloresIncompatibles = []
	
	method puedeSatisfacerPedidoConAuto(auto) {
		return auto.velocidadMaxima() >= (self.velocidadRequerida() + 10) and auto.capacidad() >= cantidadPasajeros and not self.tieneColorIncompatible(auto)
	}
	
	method velocidadRequerida() = distancia / tiempoMaximo
	
	method tieneColorIncompatible(auto) = coloresIncompatibles.any({a => a == auto.color()})
	method esColorIncompatible(color) = coloresIncompatibles.any({c => c == color})
	
	method acelerar() { tiempoMaximo -= 1 }
	method relajar() {tiempoMaximo += 1}
}
