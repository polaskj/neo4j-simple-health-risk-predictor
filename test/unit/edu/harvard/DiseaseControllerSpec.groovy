package edu.harvard



import grails.test.mixin.*
import spock.lang.*

@TestFor(DiseaseController)
@Mock(Disease)
class DiseaseControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.diseaseInstanceList
            model.diseaseInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.diseaseInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def disease = new Disease()
            disease.validate()
            controller.save(disease)

        then:"The create view is rendered again with the correct model"
            model.diseaseInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            disease = new Disease(params)

            controller.save(disease)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/disease/show/1'
            controller.flash.message != null
            Disease.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def disease = new Disease(params)
            controller.show(disease)

        then:"A model is populated containing the domain instance"
            model.diseaseInstance == disease
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def disease = new Disease(params)
            controller.edit(disease)

        then:"A model is populated containing the domain instance"
            model.diseaseInstance == disease
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def disease = new Disease()
            disease.validate()
            controller.update(disease)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.diseaseInstance == disease

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            disease = new Disease(params).save(flush: true)
            controller.update(disease)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/disease/show/$disease.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            status == 404

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def disease = new Disease(params).save(flush: true)

        then:"It exists"
            Disease.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(disease)

        then:"The instance is deleted"
            Disease.count() == 0
            response.redirectedUrl == '/disease/index'
            flash.message != null
    }
}
