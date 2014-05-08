<%@ page import="edu.harvard.Disease" %>



<div class="fieldcontain ${hasErrors(bean: diseaseInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="disease.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${diseaseInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: diseaseInstance, field: 'percentSurvival', 'error')} ">
	<label for="percentSurvival">
		<g:message code="disease.percentSurvival.label" default="Percent Survival" />
		
	</label>
	<g:field type="number" name="percentSurvival" value="${diseaseInstance.percentSurvival}" />
</div>

