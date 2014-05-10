<g:form controller="patient" action="search" method="post" class="navbar-form navbar-left" >
	<div class="form-group fieldcontain text-center">
		<input name="query" type="text" class="form-control nav-search" placeholder="${message(code: 'search.navbar.placeholder', default: 'Lucene Search Patients...')}" value="${params.query}">
	</div>
</g:form>
