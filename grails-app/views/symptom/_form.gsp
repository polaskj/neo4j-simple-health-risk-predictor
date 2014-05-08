<%@ page import="edu.harvard.Symptom" %>



<div class="fieldcontain ${hasErrors(bean: symptomInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="symptom.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${symptomInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: symptomInstance, field: 'suggestedTreatment', 'error')} ">
	<label for="suggestedTreatment">
		<g:message code="symptom.suggestedTreatment.label" default="Suggested Treatment" />
		
	</label>
	<g:textField name="suggestedTreatment" value="${symptomInstance?.suggestedTreatment}" />
</div>

