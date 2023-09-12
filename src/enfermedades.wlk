class Enfermedad {
	const tipo
	var property celulasQueAmenaza
	
	method esAgresiva(persona){
		return tipo.agresiva(persona, celulasQueAmenaza)
	}
	
	method celulasQueAmenazaAgresivamente(persona){
		if (self.esAgresiva(persona)){
			return celulasQueAmenaza
		} else {
			return 0
		}
	}
	
	method efecto(persona){
		return tipo.efecto(persona, celulasQueAmenaza)
	}
	
	method reproducirse(){
		tipo.reproducirse(self)
	}
}

object infecciosa {
	
	method agresiva(persona, celulasQueAmenaza){
		return celulasQueAmenaza > persona.celulasTotales() * 0.1
	}
	
	method efecto(persona, celulasQueAmenaza){
		var aumentoDeTemperatura
		aumentoDeTemperatura = celulasQueAmenaza * 0.001
		persona.sumarTemperatura(aumentoDeTemperatura)
	}
	
	method reproducirse(enfermedad){
		var celulas
		celulas = enfermedad.celulasQueAmenaza()
		enfermedad.celulasQueAmenaza(celulas*2)
		}
}

object autoinmune {

	method agresiva(persona, _celulasQueAmenaza){
		return persona.diasTranscurridos() > 30
	}
	
	method efecto(persona, celulasQueAmenaza){
		persona.destruirCelulas(celulasQueAmenaza)
	}
	
	method reproducirse(_enfermedad){
	}
}
