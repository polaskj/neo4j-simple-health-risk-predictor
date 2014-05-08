
<%@ page import="edu.harvard.Disease" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'disease.label', default: 'Disease')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-disease" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="disease.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: diseaseInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="disease.percentSurvival.label" default="Percent Survival" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: diseaseInstance, field: "percentSurvival")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
