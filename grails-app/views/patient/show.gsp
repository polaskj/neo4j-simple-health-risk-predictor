
<%@ page import="edu.harvard.Patient"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'patient.label', default: 'Patient')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

	<section id="show-patient" class="first">

		<table class="table">
			<tbody>
				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.name.label" default="Name" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: patientInstance, field: "name")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.dateOfBirth.label" default="Date Of Birth" /></td>

					<td valign="top" class="value"><g:formatDate
							date="${patientInstance?.dateOfBirth}" /></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.dateOfDeath.label" default="Date Of Death" /></td>

					<td valign="top" class="value"><g:formatDate
							date="${patientInstance?.dateOfDeath}" /></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.diseases.label" default="Diseases" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${patientInstance.diseases}" var="d">
								<li><g:link controller="disease" action="show" id="${d.id}">
										${d?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.relatives.label" default="Relatives" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${patientInstance.relatives}" var="r">
								<li><g:link controller="patient" action="show" id="${r.id}">
										${r?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.symptoms.label" default="Symptoms" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${patientInstance.symptoms}" var="s">
								<li><g:link controller="symptom" action="show" id="${s.id}">
										${s?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

<tr><td colspan="2"><strong>Advanced Graph Relationships</strong></td>


				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.symptoms.label"
							default="Others with similar symptoms" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${otherPatientsWithSymptoms}" var="s">
								<li><g:link controller="patient" action="show" id="${s.id}">
										${s?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.symptoms.label"
							default="Diseases most closely linked to patient's symptoms" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${diseaseSameSymptomsList}" var="s">
								<li><g:link controller="disease" action="show" id="${s.id}">
										${s?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>
				
					<tr class="prop">
					<td valign="top" class="name"><g:message
							code="patient.symptoms.label"
							default="Deadly Hereditary Diseases (listed by most occurances in family)" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${likelyHereditaryDiseases}" var="s">
								<li><g:link controller="disease" action="show" id="${s.id}">
										${s?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

			</tbody>
		</table>


	</section>

</body>

</html>
