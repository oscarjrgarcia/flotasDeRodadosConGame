import rodados.*
import pedidos.*

class Dependencia {
	var property flotaDeRodados = []
	var property empleados
	var property nombre
	var pedidos = []
	
	method agregarAFlota(rodado) {flotaDeRodados.add(rodado)}
	method quitarDeFlota(rodado) {flotaDeRodados.remove(rodado)}
	method pesoTotalFlota() = flotaDeRodados.sum({r => r.peso()})
	method estaBienEquipada() = flotaDeRodados.size() >= 3 and flotaDeRodados.all({r => r.velocidadMaxima() >= 100})
	method capacidadTotal() = flotaDeRodados.sum({r => r.capacidad()})
	method capacidadTotalEnColor(color) = flotaDeRodados.filter({r => r.color() == color}).sum({r => r.capacidad()})
	method colorDelRodadoMasRapido() = flotaDeRodados.max({r => r.velocidadMaxima()}).color()
	method capacidadFaltante() = empleados - self.capacidadTotal()
	method esGrande() = empleados >= 40 and flotaDeRodados.size() >= 5
	
	method agregarPedido(pedido) {pedidos.add(pedido)}
	method quitarPedido(pedido) {pedidos.remove(pedido)}
	method totalPasajerosEnPedidos() = pedidos.sum({p => p.cantidadPasajeros()})
	method pedidosQueNoSePuedenSatisfacer() = pedidos.filter({p => not self.puedeSatisfacerPedido(p)})
	method puedeSatisfacerPedido(pedido) = flotaDeRodados.any({p => pedido.puedeSatisfacerPedidoConAuto(p)})
	method esIncompatibleEnTodosLosPedidos(color) = pedidos.all({p => p.esColorIncompatible(color)})
}
