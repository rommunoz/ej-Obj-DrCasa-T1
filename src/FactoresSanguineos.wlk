// idea: throw new Exception(message = "factorA no puede dar a" + otroFactor.toString() )
object factorA {
	method puedeDarA(otroFactor){
		 return #{factorR, self}.contains(otroFactor)
	}
	
	method puedeRecibirDe(otroFactor){
		return #{self, factorO}.contains(otroFactor)
	}
}
object factorO {
	method puedeDarA(_otroFactor){
		return true
	}
	
	method puedeRecibirDe(otroFactor){
		return otroFactor === factorA
	}
}
object factorR {
	method puedeDarA(otroFactor){
		return otroFactor === self
	}
	
	method puedeRecibirDe(_otroFactor){
		return true
	}
}
