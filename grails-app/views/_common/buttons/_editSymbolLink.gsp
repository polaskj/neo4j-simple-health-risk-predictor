<!-- 
This button is used to call the show page.
-->

<!-- Button -->
<span class=""> 
	<g:link action="edit" id="${item ? item.id : params.id}" role="button" class="btn btn-success btn-sm" title="${message(code: 'default.button.edit.label', default: 'Edit')}">
		<i class="glyphicon glyphicon-pencil"></i>
	</g:link>
</span>
