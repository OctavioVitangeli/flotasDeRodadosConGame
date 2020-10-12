import wollok.game.*
import mapa.*

object azul {}
object rojo {}
object verde {}
object blanco {}
object bordo {}
object cremita {}

class Corsa {
	var property position = game.at(3,3)
	var property color = null 
	var property image = "autitorojo.png"
	const posiciones = []
	
	method capacidad() { return 4 }
	
	method velocidadMaxima() { return 150 }
	
	method peso() { return 1300 }
	
	method configurarTeclado(){
		keyboard.a().onPressDo({image = "autoazul.png"})
		keyboard.v().onPressDo({image = "autoverde.png"})
		keyboard.r().onPressDo({image = "autitorojo.png"})
		keyboard.up().onPressDo({ self.moverNorte()})
		keyboard.down().onPressDo({self.moverSur()})
		keyboard.left().onPressDo({self.moverOeste()})
		keyboard.right().onPressDo({self.moverEste()})
		
	}
	
		
	method moverNorte(){
			if(self.position().y() < game.height() - 1){
				self.position(self.position().up(1))
				posiciones.add(self.position())	}
		}
		
	method moverSur(){
			if(self.position().y() > 0){
				self.position(self.position().down(1))
				posiciones.add(self.position()) }
		}
		
	method moverOeste(){
			if(self.position().x() > 0){
				self.position(self.position().left(1))
				posiciones.add(self.position()) }
		}
		
	method moverEste(){
			if(self.position().x() < game.width() - 1){
				self.position(self.position().right(1))
				posiciones.add(self.position()) }
		}
	
	
	
	method pasoPor(posicion) { return posiciones.contains(posicion)}
	
	method pasoPorFila(numero){return posiciones.map({ posicion => posicion.x() }).contains(numero) }
	
	
	}

		
	

class Kwid {

	var  tieneTanqueAdicional = false
	const color = azul
	
	method ponerTanque(){tieneTanqueAdicional = true}
	method sacarTanque(){tieneTanqueAdicional = false}
	
	method capacidad() { 
    	return if(tieneTanqueAdicional) 3 else 4}
    	
	method velocidadMaxima() {
    	if (tieneTanqueAdicional) {
			return 120
		} else {
			return 110
		}
	}
	method peso() {
    	if (tieneTanqueAdicional) {
			return 1350
		} else {
			return 1200
		}
	}
	method color() { return color }
}

class AutoEspecial {
	var property color  
	var property capacidad
	var property velocidadMaxima
	var property peso
}


object trafic {
	var  motor = null
	var  interior = null
	
	method setInterior(unInterior){interior = unInterior}
	method setMotor(unMotor){motor = unMotor}
	
	method capacidad() { return interior.capacidad() } 
	method velocidadMaxima() { return motor.velocidadMaxima() }
	method peso() {
		return 4000 + motor.peso() + interior.peso()
	}
	method color() { return blanco }
}

object interiorComodo {
	const capacidad = 5
	const peso = 700
	method capacidad(){return capacidad}
	method peso(){return peso}
}

object interiorPopular {
	const capacidad = 12
	const peso = 1000
	method capacidad(){return capacidad}
	method peso(){return peso}
}

object motorPulenta {
	const peso = 800
	const velocidad = 130
	method velocidadMaxima(){return velocidad}
	method peso(){return peso}
}

object motorBataton {
	const peso = 500
	const velocidad = 80
	method velocidadMaxima(){return velocidad}
	method peso(){return peso}
}



