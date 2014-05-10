package edu.harvard

class Patient {

	String name
	Date dateOfBirth
	Date dateOfDeath


	static	hasMany		= [symptoms:Symptom,diseases:Disease,relatives:Patient]	// tells GORM to associate other domain objects for a 1-n or n-m mapping

	
	static mapWith = "neo4j"
	static	mapping = {
		name index: 'name_idx'
	}

	static	constraints = {
		dateOfDeath blank:true,nullable:true
		symptoms blank:true,nullable:true
		diseases blank:true,nullable:true
		relatives blank:true,nullable:true
	}


	public String toString() {
		return "${name}"
	}
}
