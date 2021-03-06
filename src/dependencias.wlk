import vehiculos.*

class Dependencia {
	const flota = []	
	const registroDePedidos = []
	
	var property cantidadDeEmpleados
	
	method agregarAFlota(vehiculo) { flota.add(vehiculo) }
	
	method quitarDeFlota(vehiculo) { flota.remove(vehiculo) }
	
	method pesoTotalFlota() { return flota.sum({ veh => veh.peso() }) }
	
	method estaBienEquipada() { 
		return flota.size() >= 3 and flota.all({ veh => veh.velocidadMaxima() >= 100 })}
	
	method capacidadTotalEnColor(color) {
		return flota.filter({ veh => veh.color() == color }).sum({ veh => veh.capacidad() })}
	
	method capacidadTotalEnColor_variante(color) {
		return self.vehiculosDeColor(color).sum({ veh => veh.capacidad() })}
	
	method vehiculosDeColor(color) {
		return flota.filter({ veh => veh.color() == color })}
	
	method colorDelRodadoMasRapido() {
		return flota.max({ veh => veh.velocidadMaxima() }).color()}
	
	method capacidadFaltante() {
		return cantidadDeEmpleados - self.capacidadFlota()}
	method capacidadFlota() { 
		return flota.sum({ veh => veh.capacidad() })}
	
	method esGrande() {
		return cantidadDeEmpleados >= 40 and flota.size() >= 5}
	
	method agregarPedidos(pedido){registroDePedidos.add(pedido)}
	
	method removerPedido(pedido){registroDePedidos.remove(pedido)}
	
	method totalPasajeros(){return registroDePedidos.sum({pedidos => pedidos.pasajeros()})}
	
	method caulNoPuede(color){ return not registroDePedidos.any({pedidos => pedidos.puedeSuplirPedido(color) }) }
	
	method relajarTodos(){ registroDePedidos.forEach({ pedidos => pedidos.relajar()}) }
	
	method todosSonIncompatibles(color){ return registroDePedidos.all({ pedidos => pedidos.coloresIncompatibles() == color }) }


}
	class Pedidos{
		var distancia
		var tiempoMax
		var pasajeros
		const coloresIncompatibles = []
		
		method coloresIncompatibles(){return coloresIncompatibles}
		method pasajeros(){return pasajeros}
		method tiempoMax(){return tiempoMax}
		method acelerar(){return tiempoMax + 1}
		method relajar(){return tiempoMax -1}
		method agregarColores(color){coloresIncompatibles.add(color)}
		method setTiempo(tiempo){tiempoMax = tiempo}
		method setDistancia(kms){distancia = kms}
		method setPasajeros(psj){pasajeros = psj}
		method velocidadRequerida(){return  distancia/ tiempoMax}
		method puedeSuplirPedido(auto){
			return auto.velocidadMaxima() - tiempoMax > 10 
			and auto.capacidad() >= pasajeros 
			and not coloresIncompatibles.contains({automovil => auto.color()})
			
			}
		
		
		
		
}