package edu.harvard



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PatientController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Patient.list(params), model:[patientInstanceCount: Patient.count()]
	}

	def show(Patient patientInstance) {
		respond patientInstance
	}

	def create() {
		respond new Patient(params)
	}

	@Transactional
	def save(Patient patientInstance) {
		if (patientInstance == null) {
			notFound()
			return
		}

		if (patientInstance.hasErrors()) {
			respond patientInstance.errors, view:'create'
			return
		}

		patientInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'patientInstance.label', default: 'Patient'),
					patientInstance.id
				])
				redirect patientInstance
			}
			'*' { respond patientInstance, [status: CREATED] }
		}
	}

	def edit(Patient patientInstance) {
		respond patientInstance
	}

	@Transactional
	def update(Patient patientInstance) {
		if (patientInstance == null) {
			notFound()
			return
		}

		if (patientInstance.hasErrors()) {
			respond patientInstance.errors, view:'edit'
			return
		}

		patientInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Patient.label', default: 'Patient'),
					patientInstance.id
				])
				redirect patientInstance
			}
			'*'{ respond patientInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Patient patientInstance) {

		if (patientInstance == null) {
			notFound()
			return
		}

		patientInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Patient.label', default: 'Patient'),
					patientInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'patientInstance.label', default: 'Patient'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	//Answers the question: Find others with the same symptoms as I do
	def othersWithSymptoms() {
		//response.contentType = "text/plain"
		def otherPatients = Patient.cypherStatic("""
START me=node(${params.id})
MATCH me-[:symptoms]->commonSymptom<-[:symptoms]-others
RETURN others
         """).collect { Patient.createInstanceForNode(it.others)}


		//		 respond Talk.list(params), model:[talkInstanceCount: Talk.count()]
		//		render (view:'/talk/index', model:[talkInstanceList:talks,talkInstanceCount: Talk.count()])
		render otherPatients
	}


	//Answers the question: Find diseases where others displayed same symptoms
	def likelyDiseases() {
		//response.contentType = "text/plain"
		def diseaseList = Disease.cypherStatic("""
START me=node(${params.id})
MATCH me-[:symptoms]->commonSymptom<-[:symptoms]-others-[:diseases]-dis
RETURN dis
         """).collect { Disease.createInstanceForNode(it.dis)}


		//		 respond Talk.list(params), model:[talkInstanceCount: Talk.count()]
		//		render (view:'/talk/index', model:[talkInstanceList:talks,talkInstanceCount: Talk.count()])
		render diseaseList
	}
	//Answers the question: Find top 5 hereditary diseases which are deadly (2 degrees)
	def likelyHereditaryDisease() {
		def diseaseList = Disease.cypherStatic("""
START me=node(${params.id})
MATCH me-[:relatives]->fam,
fam	-[:diseases]->d
WITH d, count(*) AS numInstances
ORDER BY numInstances, d.percentSurvival DESC LIMIT 5
WHERE d.percentSurvival < 50
RETURN d
         """).collect { Disease.createInstanceForNode(it.d)}

		render (view:'/disease/index', model:[diseaseInstanceList:diseaseList,diseaseInstanceCount: diseaseList.size()])
	}
	
	//Most likely diseases contracted by users with the same symptoms
}
