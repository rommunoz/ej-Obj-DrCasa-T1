import FactoresSanguineos.*

class Persona {
	
	const enfermedades = #{}
	var temperaturaCorporal = 36
	var celulasTotales = 3000000
	const factorSanguineo = factorO	
	
	method contraerEnfermedad(unaEnfermedad){
		enfermedades.add(unaEnfermedad)
	}

	method vivir(unosDias) {
		unosDias.times{dia => self.vivirUnDia()}
	}
	
	method tiene(enfermedad) {
		return enfermedades.contains(enfermedad)
	}
	
	method vivirUnDia() {
			enfermedades.forEach{enfermedad => enfermedad.efecto(self)}
	}
	
	method sumarTemperatura(unosGrados){
		temperaturaCorporal = 45.min(temperaturaCorporal + unosGrados)
	}
	
	method estaEnComa() {
		return self.temperaturaCritica() || self.cantidadCriticaDeCelulas()
	}
	
	method temperaturaCritica() {
		return temperaturaCorporal == 45
	}	
	
	method cantidadCriticaDeCelulas() {
		return celulasTotales < 1000000
	}  
	
	method destruirCelulas(cantidadADestruir){
		celulasTotales = 0.max(self.celulasTotales() - cantidadADestruir)
	}
	
	method enfermedadMasAmenazante(){
		return enfermedades.max{enfermedad => enfermedad.celulasQueAmenaza()}
	}
	
	method totalCelulasAfectadasPorAgresivas(){
		return self.agresivas().sum{enfermedad => enfermedad.celulasQueAmenaza()}
	}
	
	method celulasTotales(){
		return celulasTotales
	}
		
	method agresivas(){
		return enfermedades.filter{
			enfermedad => enfermedad.esAgresiva(self)
		}
	}
	
	method medicateCon(unaDosis) {
		enfermedades.forEach{enfermedad => enfermedad.atenuatePara(self, unaDosis)}
	}
	
	method curarseDe(unaEnfermedad) {
		enfermedades.remove(unaEnfermedad)
	}
	
	method temperaturaCorporal(){
		return temperaturaCorporal
	}
	
	method morir() {
		temperaturaCorporal = 0
	}
	
	
	method intentarDonarA(otraPersona, cantidadDeCelulas) {
		if (!self.esCompatibleCon(otraPersona)){ //segun factor, ida y vuelta
			throw new Exception (message = "No son compatibles")		//(message = self.toString() + " no es compatible con " + otraPersona.toString())	
		}
		if (!self.tieneSuficientesCelulas(cantidadDeCelulas)){
			throw new Exception (message = "El donante no tiene suficientes celulas")
		}
		self.realizarTransfusion(otraPersona, cantidadDeCelulas)
	}
//	method intentarDonarA(otraPersona, cantidadDeCelulas) {
//		if (! self.puedeDonarA(otraPersona, cantidadDeCelulas)){
//			throw new Exception(message = "No se pudo donar")
//		}
//		self.realizarTransfusion(otraPersona, cantidadDeCelulas)
//	}
//	
//	method puedeDonarA(otraPersona, cantidadDeCelulas) {
//		if (!self.esCompatibleCon(otraPersona)){ //segun factor, ida y vuelta
//			throw new Exception (message = self + " no es compatible con " + otraPersona)		
//		}
//		if (!self.tieneSuficientesCelulas(cantidadDeCelulas)){
//			throw new Exception (message = self + " no tiene suficientes celulas")
//		}
//	}
//	
	method realizarTransfusion(otraPersona, cantidadDeCelulas) {
		otraPersona.aumentarCelulasTotalesEn(cantidadDeCelulas)
		self.perderCelulasTotalesEn(cantidadDeCelulas)
	}
	
	method esCompatibleCon(otraPersona) {
		return factorSanguineo.puedeDarA(otraPersona.factorSanguineo()) and
				otraPersona.puedeRecibirDeFactor(self.factorSanguineo())
	}
	
	method factorSanguineo() {
		return factorSanguineo
	}
	
	method puedeRecibirDeFactor(unFactor) {
		return factorSanguineo.puedeRecibirDe(unFactor)
	}
	
	method tieneSuficientesCelulas(cantidadDeCelulas) {
		return cantidadDeCelulas <= celulasTotales/4
	}
	
	method aumentarCelulasTotalesEn(unasCelulas) {
		celulasTotales += unasCelulas 
	}
	
	method perderCelulasTotalesEn(unasCelulas) { //para arreglar la semantica
		self.destruirCelulas(unasCelulas) 
	}
	
}


