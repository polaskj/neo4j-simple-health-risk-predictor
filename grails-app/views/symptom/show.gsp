
<%@ page import="edu.harvard.Symptom" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'symptom.label', default: 'Symptom')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-symptom" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="symptom.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: symptomInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="symptom.suggestedTreatment.label" default="Suggested Treatment" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: symptomInstance, field: "suggestedTreatment")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
