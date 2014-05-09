
<%@ page import="edu.harvard.Symptom" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'symptom.label', default: 'Symptom')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-symptom" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'symptom.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="suggestedTreatment" title="${message(code: 'symptom.suggestedTreatment.label', default: 'Suggested Treatment')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${symptomInstanceList}" status="i" var="symptomInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${symptomInstance.id}">${fieldValue(bean: symptomInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: symptomInstance, field: "suggestedTreatment")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${symptomInstanceCount}" />
	</div>
</section>

</body>

</html>
