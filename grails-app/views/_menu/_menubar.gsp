<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear"
		data-filter="true">


		<li
			class="controller${params.controller == 'patient' ? " active" : ""}">
			<g:link controller="patient">Patient </g:link> </li>

		<li
			class="controller${params.controller == 'disease' ? " active" : ""}"><g:link controller="disease">Disease </g:link></li>

		<li
			class="controller${params.controller == 'symptom' ? " active" : ""}"><g:link controller="symptom">Symptom </g:link></li>

		<li
			class="controller${params.controller == 'graphviz' ? " active" : ""}"><g:link controller="graphviz" target="_blank">Graph Visualization</g:link></li>
<li
			class="controller${params.controller == 'neo4j' ? " active" : ""}"><g:link controller="neo4j" target="_blank">Neo4J Console</g:link></li>




	</ul>
</div>

