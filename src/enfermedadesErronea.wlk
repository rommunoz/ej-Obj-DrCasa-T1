//class Enfermedad {
//	const tipo
//	
//	method esAgresiva(persona){
//		return tipo.agresiva(persona)
//	}
//	
//	method efecto(persona){
//		return tipo.efecto(persona)
//	}
//}
//
//class Infecciosa {
//	var property celulasQueAmenaza
//	
//	method agresiva(persona){
//		return celulasQueAmenaza > persona.celulasTotales() * 0.1
//	}
//	
//	method efecto(persona){
//		var aumentoDeTemperatura
//		aumentoDeTemperatura = celulasQueAmenaza * 0.001
//		persona.sumarTemperatura(aumentoDeTemperatura)
//	}
//	
//	method reproducirse(){
//		celulasQueAmenaza *= 2
//	}
//}
//
//class Autoinmune {
//	var property celulasQueAmenaza
//	
//	method agresiva(persona){
//		return persona.diasTranscurridos() > 30
//	}
//	
//	method efecto(persona){
//		persona.destruirCelulas(celulasQueAmenaza)
//	}
//}