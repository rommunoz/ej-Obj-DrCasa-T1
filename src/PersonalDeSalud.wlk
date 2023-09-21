import Persona.*

class PersonalDeSalud inherits Persona{
	
	override method contraerEnfermedad(unaEnfermedad){
		super(unaEnfermedad)
		self.atenderA(self)
	}
	
	method atenderA(unaPersona)
}
