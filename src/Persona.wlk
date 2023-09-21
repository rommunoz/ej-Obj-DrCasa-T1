
class Persona {
	
	const enfermedades = #{}
	var temperaturaCorporal = 36
	var celulasTotales = 3000000
	
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
	
}


