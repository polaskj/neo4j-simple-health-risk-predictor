package edu.harvard



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SpeakerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Speaker.list(params), model:[speakerInstanceCount: Speaker.count()]
    }

    def show(Speaker speakerInstance) {
        respond speakerInstance
    }

    def create() {
        respond new Speaker(params)
    }

    @Transactional
    def save(Speaker speakerInstance) {
        if (speakerInstance == null) {
            notFound()
            return
        }

        if (speakerInstance.hasErrors()) {
            respond speakerInstance.errors, view:'create'
            return
        }

        speakerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'speakerInstance.label', default: 'Speaker'), speakerInstance.id])
                redirect speakerInstance
            }
            '*' { respond speakerInstance, [status: CREATED] }
        }
    }

    def edit(Speaker speakerInstance) {
        respond speakerInstance
    }

    @Transactional
    def update(Speaker speakerInstance) {
        if (speakerInstance == null) {
            notFound()
            return
        }

        if (speakerInstance.hasErrors()) {
            respond speakerInstance.errors, view:'edit'
            return
        }

        speakerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Speaker.label', default: 'Speaker'), speakerInstance.id])
                redirect speakerInstance
            }
            '*'{ respond speakerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Speaker speakerInstance) {

        if (speakerInstance == null) {
            notFound()
            return
        }

        speakerInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Speaker.label', default: 'Speaker'), speakerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'speakerInstance.label', default: 'Speaker'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
