<%@ page import="edu.harvard.Symptom" %>



			<div class="${hasErrors(bean: symptomInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="symptom.name.label" default="Name" /></label>
				<div>
					<g:textField class='form-control' name="name" value="${symptomInstance?.name}" />
					<span class="help-inline">${hasErrors(bean: symptomInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: symptomInstance, field: 'suggestedTreatment', 'error')} ">
				<label for="suggestedTreatment" class="control-label"><g:message code="symptom.suggestedTreatment.label" default="Suggested Treatment" /></label>
				<div>
					<g:textField class='form-control' name="suggestedTreatment" value="${symptomInstance?.suggestedTreatment}" />
					<span class="help-inline">${hasErrors(bean: symptomInstance, field: 'suggestedTreatment', 'error')}</span>
				</div>
			</div>

