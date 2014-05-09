
<%@ page import="edu.harvard.Disease" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'disease.label', default: 'Disease')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-disease" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'disease.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="percentSurvival" title="${message(code: 'disease.percentSurvival.label', default: 'Percent Survival')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${diseaseInstanceList}" status="i" var="diseaseInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${diseaseInstance.id}">${fieldValue(bean: diseaseInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: diseaseInstance, field: "percentSurvival")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${diseaseInstanceCount}" />
	</div>
</section>

</body>

</html>
