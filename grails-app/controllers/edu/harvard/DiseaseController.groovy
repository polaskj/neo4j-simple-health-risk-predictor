package edu.harvard



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DiseaseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Disease.list(params), model:[diseaseInstanceCount: Disease.count()]
    }

    def show(Disease diseaseInstance) {
        respond diseaseInstance
    }

    def create() {
        respond new Disease(params)
    }

    @Transactional
    def save(Disease diseaseInstance) {
        if (diseaseInstance == null) {
            notFound()
            return
        }

        if (diseaseInstance.hasErrors()) {
            respond diseaseInstance.errors, view:'create'
            return
        }

        diseaseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diseaseInstance.label', default: 'Disease'), diseaseInstance.id])
                redirect diseaseInstance
            }
            '*' { respond diseaseInstance, [status: CREATED] }
        }
    }

    def edit(Disease diseaseInstance) {
        respond diseaseInstance
    }

    @Transactional
    def update(Disease diseaseInstance) {
        if (diseaseInstance == null) {
            notFound()
            return
        }

        if (diseaseInstance.hasErrors()) {
            respond diseaseInstance.errors, view:'edit'
            return
        }

        diseaseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Disease.label', default: 'Disease'), diseaseInstance.id])
                redirect diseaseInstance
            }
            '*'{ respond diseaseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Disease diseaseInstance) {

        if (diseaseInstance == null) {
            notFound()
            return
        }

        diseaseInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Disease.label', default: 'Disease'), diseaseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diseaseInstance.label', default: 'Disease'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
