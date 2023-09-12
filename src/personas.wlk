
class Persona {
	
	var property enfermedades = []
	var temperaturaCorporal
	var celulasTotales
	var diasTranscurridos = 0
	//var dias = diasTranscurridos //auxiliar para metodo (dudosisimo)
	
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
	method vivir(unosDias) {
		unosDias.times{
			self.efectuarEnfermedades()
		}
		diasTranscurridos += unosDias //luego lo uso para autoinmune
	}
	
	method efectuarEnfermedades() {
			enfermedades.map{enfermedad => enfermedad.efecto(self)}
	}
	
	method sumarTemperatura(unosGrados){
		temperaturaCorporal += unosGrados
	}
	
	method estaEnComa(){
		return temperaturaCorporal >= 45 || celulasTotales < 1000000
	}
	
	method destruirCelulas(cantidadADestruir){
		celulasTotales -= cantidadADestruir //falta contemplar que no tenga celulas negativas
	}
	
	method enfermedadMasAmenazante(){
		return enfermedades.max{enfermedad => enfermedad.celulasQueAmenaza()}
	}
	
	method totalCelulasAfectadasPorAgresivas(){
		return enfermedades.map{
				enfermedad => enfermedad.celulasQueAmenazaAgresivamente(self)
		}.sum()
	}
}
