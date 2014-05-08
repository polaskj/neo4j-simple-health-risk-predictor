package edu.harvard



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SymptomController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Symptom.list(params), model:[symptomInstanceCount: Symptom.count()]
    }

    def show(Symptom symptomInstance) {
        respond symptomInstance
    }

    def create() {
        respond new Symptom(params)
    }

    @Transactional
    def save(Symptom symptomInstance) {
        if (symptomInstance == null) {
            notFound()
            return
        }

        if (symptomInstance.hasErrors()) {
            respond symptomInstance.errors, view:'create'
            return
        }

        symptomInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'symptomInstance.label', default: 'Symptom'), symptomInstance.id])
                redirect symptomInstance
            }
            '*' { respond symptomInstance, [status: CREATED] }
        }
    }

    def edit(Symptom symptomInstance) {
        respond symptomInstance
    }

    @Transactional
    def update(Symptom symptomInstance) {
        if (symptomInstance == null) {
            notFound()
            return
        }

        if (symptomInstance.hasErrors()) {
            respond symptomInstance.errors, view:'edit'
            return
        }

        symptomInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Symptom.label', default: 'Symptom'), symptomInstance.id])
                redirect symptomInstance
            }
            '*'{ respond symptomInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Symptom symptomInstance) {

        if (symptomInstance == null) {
            notFound()
            return
        }

        symptomInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Symptom.label', default: 'Symptom'), symptomInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'symptomInstance.label', default: 'Symptom'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
