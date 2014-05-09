
<%@ page import="edu.harvard.Patient" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-patient" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateOfBirth" title="${message(code: 'patient.dateOfBirth.label', default: 'Date Of Birth')}" />
			
				<g:sortableColumn property="dateOfDeath" title="${message(code: 'patient.dateOfDeath.label', default: 'Date Of Death')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'patient.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${patientInstanceList}" status="i" var="patientInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${patientInstance.id}">${fieldValue(bean: patientInstance, field: "dateOfBirth")}</g:link></td>
			
				<td><g:formatDate date="${patientInstance.dateOfDeath}" /></td>
			
				<td>${fieldValue(bean: patientInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${patientInstanceCount}" />
	</div>
</section>

</body>

</html>
