<%@ page import="edu.harvard.Patient" %>



<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="patient.dateOfBirth.label" default="Date Of Birth" />
		
	</label>
	<g:datePicker name="dateOfBirth" precision="day" value="${patientInstance?.dateOfBirth}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'dateOfDeath', 'error')} ">
	<label for="dateOfDeath">
		<g:message code="patient.dateOfDeath.label" default="Date Of Death" />
		
	</label>
	<g:datePicker name="dateOfDeath" precision="day" value="${patientInstance?.dateOfDeath}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'diseases', 'error')} ">
	<label for="diseases">
		<g:message code="patient.diseases.label" default="Diseases" />
		
	</label>
	<g:select name="diseases" from="${edu.harvard.Disease.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${patientInstance?.diseases*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="patient.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${patientInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'relatives', 'error')} ">
	<label for="relatives">
		<g:message code="patient.relatives.label" default="Relatives" />
		
	</label>
	<g:select name="relatives" from="${edu.harvard.Patient.list()}" multiple="multiple" optionKey="id" size="5" value="${patientInstance?.relatives*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientInstance, field: 'symptoms', 'error')} ">
	<label for="symptoms">
		<g:message code="patient.symptoms.label" default="Symptoms" />
		
	</label>
	<g:select name="symptoms" from="${edu.harvard.Symptom.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${patientInstance?.symptoms*.id}" class="many-to-many"/>
</div>

