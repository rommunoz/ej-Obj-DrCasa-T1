import enfermedades.*

object celulasAmenazadas {
	method apply(enfermedad){
		return enfermedad.celulasQueAmenaza()
	}
}

class Persona {
	
	const property enfermedades = []
	var property temperaturaCorporal = 36
	var property celulasTotales
	var property diasTranscurridos = 0
	//var dias = diasTranscurridos //auxiliar para metodo (dudosisimo)
	const criterio = celulasAmenazadas // evitar una logica repetida
	
	method contraerEnfermedad(unaEnfermedad){
		enfermedades.add(unaEnfermedad)
	}
//	method efectuarEnfermedades() {
//		if(dias-- > 0){
//			enfermedades.map{
//				enfermedad => enfermedad.efecto(self)
//			}
//			self.efectuarEnfermedades()
//		}
//	}

//	method vivir(unosDias) { // como hago esto para darle una cantidad de dias
//		unosDias.times{self.efectuarEnfermedades()}
//		diasTranscurridos += unosDias //luego lo uso para autoinmune
//	}
	
	method vivirUnDia() { 
		self.efectuarEnfermedades()
		diasTranscurridos++ //luego lo uso para autoinmune
	}
	
	method efectuarEnfermedades() {
			enfermedades.forEach{enfermedad => enfermedad.efecto(self)}
	}
	
	method sumarTemperatura(unosGrados){
		temperaturaCorporal = (temperaturaCorporal + unosGrados).min(45)
	}
	
	method estaEnComa(){
		return temperaturaCorporal == 45 || celulasTotales < 1000000
	}
	
	method estaEnComaV2(){
		return self.temperaturaCritica() || self.cantidadCriticaDeCelulas()
	}
	
	method temperaturaCritica() {
		return temperaturaCorporal == 45
	}	
	
	method cantidadCriticaDeCelulas() {
		return celulasTotales < 1000000
	}  
	
	method destruirCelulas(cantidadADestruir){
		celulasTotales = (celulasTotales - cantidadADestruir).max(0)
	}
	
	method enfermedadMasAmenazante(){
		return enfermedades.max{enfermedad => enfermedad.celulasQueAmenaza()}
	}
	
	
	method totalCelulasAfectadasPorAgresivas(){
		return self.agresivas().sum{enfermedad => enfermedad.celulasQueAmenaza()}
	}
	
	method totalCelulasAfectadasPorAgresivasV2(){
		return self.agresivas().sum(criterio)
	}
			
	method agresivas(){
		return enfermedades.filter{
			enfermedad => enfermedad.esAgresiva(self)
			}
	}
}


