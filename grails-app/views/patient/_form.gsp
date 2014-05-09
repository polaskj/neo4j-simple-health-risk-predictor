<%@ page import="edu.harvard.Patient"%>

<div
	class="${hasErrors(bean: patientInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message
			code="patient.name.label" default="Name" /></label>
	<div>
		<g:textField class='form-control' name="name"
			value="${patientInstance?.name}" />
		<span class="help-inline"> ${hasErrors(bean: patientInstance, field: 'name', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: patientInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth" class="control-label"><g:message
			code="patient.dateOfBirth.label" default="Date Of Birth" /></label>
	<div>
		<g:datePicker name="dateOfBirth" precision="day"
			value="${patientInstance?.dateOfBirth}" />
		<%--					<bs:datePicker name="dateOfBirth" precision="day" value="${patientInstance?.dateOfBirth}" />--%>
		<span class="help-inline"> ${hasErrors(bean: patientInstance, field: 'dateOfBirth', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: patientInstance, field: 'dateOfDeath', 'error')} ">
	<label for="dateOfDeath" class="control-label"><g:message
			code="patient.dateOfDeath.label" default="Date Of Death" /></label>
	<div>
		<g:datePicker name="dateOfDeath" precision="day"
			value="${patientInstance?.dateOfBirth}" />

		<%--					<bs:datePicker name="dateOfDeath" precision="day" value="${patientInstance?.dateOfDeath}" />--%>
		<span class="help-inline"> ${hasErrors(bean: patientInstance, field: 'dateOfDeath', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: patientInstance, field: 'diseases', 'error')} ">
	<label for="diseases" class="control-label"><g:message
			code="patient.diseases.label" default="Diseases" /></label>
	<div>
		<g:select class="form-control" name="diseases"
			from="${edu.harvard.Disease.list()}" multiple="multiple"
			optionKey="id" size="5" value="${patientInstance?.diseases*.id}"
			class="many-to-many" />
		<span class="help-inline"> ${hasErrors(bean: patientInstance, field: 'diseases', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: patientInstance, field: 'relatives', 'error')} ">
	<label for="relatives" class="control-label"><g:message
			code="patient.relatives.label" default="Relatives" /></label>
	<div>
		<g:select class="form-control" name="relatives"
			from="${edu.harvard.Patient.list()}" multiple="multiple"
			optionKey="id" size="5" value="${patientInstance?.relatives*.id}"
			class="many-to-many" />
		<span class="help-inline"> ${hasErrors(bean: patientInstance, field: 'relatives', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: patientInstance, field: 'symptoms', 'error')} ">
	<label for="symptoms" class="control-label"><g:message
			code="patient.symptoms.label" default="Symptoms" /></label>
	<div>
		<g:select class="form-control" name="symptoms"
			from="${edu.harvard.Symptom.list()}" multiple="multiple"
			optionKey="id" size="5" value="${patientInstance?.symptoms*.id}"
			class="many-to-many" />
		<span class="help-inline"> ${hasErrors(bean: patientInstance, field: 'symptoms', 'error')}
		</span>
	</div>
</div>

