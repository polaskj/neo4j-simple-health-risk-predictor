package edu.harvard


class Symptom {

	String name
	String suggestedTreatment

//	Date	dateCreated
//	Date	lastUpdated

	//static mapWith = "neo4j"
	static	mapping = {
		description widget: 'textarea'
	}

	static	constraints = {
	}
	public String toString() {
		return "${name}"
	}
}
