package edu.harvard


class Symptom {

	String name
	String suggestedTreatment

	static mapWith = "neo4j"
	static	mapping = {
		description widget: 'textarea'
	}

	static	constraints = {
	}
	public String toString() {
		return "${name}"
	}
}
