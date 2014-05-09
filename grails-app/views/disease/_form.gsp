<%@ page import="edu.harvard.Disease" %>



			<div class="${hasErrors(bean: diseaseInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="disease.name.label" default="Name" /></label>
				<div>
					<g:textField class='form-control' name="name" value="${diseaseInstance?.name}" />
					<span class="help-inline">${hasErrors(bean: diseaseInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: diseaseInstance, field: 'percentSurvival', 'error')} ">
				<label for="percentSurvival" class="control-label"><g:message code="disease.percentSurvival.label" default="Percent Survival" /></label>
				<div>
					<g:field class='form-control' type="number" name="percentSurvival" value="${diseaseInstance.percentSurvival}" />
					<span class="help-inline">${hasErrors(bean: diseaseInstance, field: 'percentSurvival', 'error')}</span>
				</div>
			</div>

