class UrlMappings {

	static mappings = {

        "/"	{
			controller	= 'patient'
			action		= { 'index' }
            view		= { 'index' }
        }
		"/$controller/$action?/$id?"{
			constraints {
				controller(matches:/^((?!(api|mobile|web)).*)$/)
		  	}
		}

		"403"	(view:'/_errors/403')
		"404"	(view:'/_errors/404')
		"500"	(view:'/_errors/error')
		"503"	(view:'/_errors/503')
	}
}
