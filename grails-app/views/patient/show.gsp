
<%@ page import="edu.harvard.Patient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-patient" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patient">
			
				<g:if test="${patientInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="patient.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${patientInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.dateOfDeath}">
				<li class="fieldcontain">
					<span id="dateOfDeath-label" class="property-label"><g:message code="patient.dateOfDeath.label" default="Date Of Death" /></span>
					
						<span class="property-value" aria-labelledby="dateOfDeath-label"><g:formatDate date="${patientInstance?.dateOfDeath}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.diseases}">
				<li class="fieldcontain">
					<span id="diseases-label" class="property-label"><g:message code="patient.diseases.label" default="Diseases" /></span>
					
						<g:each in="${patientInstance.diseases}" var="d">
						<span class="property-value" aria-labelledby="diseases-label"><g:link controller="disease" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="patient.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${patientInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.relatives}">
				<li class="fieldcontain">
					<span id="relatives-label" class="property-label"><g:message code="patient.relatives.label" default="Relatives" /></span>
					
						<g:each in="${patientInstance.relatives}" var="r">
						<span class="property-value" aria-labelledby="relatives-label"><g:link controller="patient" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${patientInstance?.symptoms}">
				<li class="fieldcontain">
					<span id="symptoms-label" class="property-label"><g:message code="patient.symptoms.label" default="Symptoms" /></span>
					
						<g:each in="${patientInstance.symptoms}" var="s">
						<span class="property-value" aria-labelledby="symptoms-label"><g:link controller="symptom" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:patientInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${patientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
