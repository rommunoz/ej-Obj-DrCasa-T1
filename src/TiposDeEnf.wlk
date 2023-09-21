import Enfermedades.*

class EnfermedadInfecciosa inherits Enfermedad {
	
	method esAgresiva(persona){
		return self.celulasQueAmenaza() > (0.1 * persona.celulasTotales())
	}
	
	method efecto(persona){
		persona.sumarTemperatura(self.celulasQueAmenaza() * 0.001)
	}
	
	method reproducirse(){
		celulasQueAmenaza *= 2
	}
}

class EnfermedadAutoinmune inherits Enfermedad {
	
	var cantidadDias = 0

	method esAgresiva(persona){
		return cantidadDias > 30
	}
	
	method efecto(persona){
		persona.destruirCelulas(celulasQueAmenaza)
		cantidadDias++
	}
}