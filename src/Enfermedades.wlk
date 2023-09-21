class Enfermedad {
	var celulasQueAmenaza
	
	method celulasQueAmenaza(){
		return celulasQueAmenaza
	}
	
	method atenuatePara(unaPersona, unaDosis){
		self.atenuarseEn(unaDosis * 15)
		self.validarCuracion(unaPersona)
	}
	
	method atenuarseEn(unaCantidadDeCelulas) {
		celulasQueAmenaza = 0.max(celulasQueAmenaza - unaCantidadDeCelulas)
	}
	method validarCuracion(unaPersona) {
		if(self.celulasQueAmenaza() == 0){
			unaPersona.curarseDe(self)
		}
	}
}

object muerte {
	
	method celulasQueAmenaza(){
		return 0
	}
	
	method esAgresiva(_persona){
		return true
	}
	
	method atenuatePara(_unaPersona, _unaDosis){
		//no hace nada, no se atenua
	}
	
	method efecto(persona){
		persona.morir()
	}
}
