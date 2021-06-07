import wollok.game.*

class Corsa {
	var property color 
	var property position = game.at(3, 5)
	var listaDePosiciones = []
	var property image = "autoazul.png"
	
	method capacidad() = 4
	method velocidadMaxima() = 150
	method peso() = 1300
	
	method agregarPosicionActual() {listaDePosiciones.add(position)}
	method pasoPor(posicion) =listaDePosiciones.any({p => p == posicion})
	method pasoPorFila(numero) {}
	method recorridoFilas(listaDeNumeros) {}
	
	method image(unColor) { image = unColor.image() }
	method moveteALaIzquierda() {self.position(self.position().left(1))}
	method moveteALaDerecha() {self.position(self.position().right(1))}
	method moveteParaArriba() {self.position(self.position().up(1))}
	method moveteParaAbajo() {self.position(self.position().down(1))}
}

class Kwid {
	var property tieneTanqueAdicional = true
	
	method capacidad() = if(tieneTanqueAdicional) {3} else {4}
	method velocidadMaxima() = if(tieneTanqueAdicional) {120} else {110} 
	method peso() = if(tieneTanqueAdicional) {1200 + 150} else {1200}
	method color() = "azul"
}

object trafic {
	var property interior = comodo
	var property motor = bataton
	
	method capacidad() = interior.capacidad()
	method velocidadMaxima() = motor.velocidadMaxima()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "blanco"
}

class AutoEspecial {
	var property capacidad
	var property velocidadMaxima
	var property peso
	var property color
}

object comodo {
	method capacidad() = 5
	method peso() = 700
}

object popular {
	method capacidad() = 12
	method peso()= 1000
}

object pulenta {
	method velocidadMaxima() = 130
	method peso() = 800
}

object bataton {
	method velocidadMaxima() = 80
	method peso() = 500
}

object azul {
	method image() = "autoazul.png"
}

object verde {
	method image() = "autoverde.png"
}

object rojo {
	method image() = "autitorojo.png"
}