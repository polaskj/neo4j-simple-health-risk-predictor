package edu.harvard



import grails.test.mixin.*
import spock.lang.*

@TestFor(SpeakerController)
@Mock(Speaker)
class SpeakerControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.speakerInstanceList
            model.speakerInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.speakerInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def speaker = new Speaker()
            speaker.validate()
            controller.save(speaker)

        then:"The create view is rendered again with the correct model"
            model.speakerInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            speaker = new Speaker(params)

            controller.save(speaker)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/speaker/show/1'
            controller.flash.message != null
            Speaker.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def speaker = new Speaker(params)
            controller.show(speaker)

        then:"A model is populated containing the domain instance"
            model.speakerInstance == speaker
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def speaker = new Speaker(params)
            controller.edit(speaker)

        then:"A model is populated containing the domain instance"
            model.speakerInstance == speaker
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def speaker = new Speaker()
            speaker.validate()
            controller.update(speaker)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.speakerInstance == speaker

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            speaker = new Speaker(params).save(flush: true)
            controller.update(speaker)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/speaker/show/$speaker.id"
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
            def speaker = new Speaker(params).save(flush: true)

        then:"It exists"
            Speaker.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(speaker)

        then:"The instance is deleted"
            Speaker.count() == 0
            response.redirectedUrl == '/speaker/index'
            flash.message != null
    }
}
