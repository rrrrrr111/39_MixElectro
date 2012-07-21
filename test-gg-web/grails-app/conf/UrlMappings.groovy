class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
				
			}
		}

		"/"(controller:"mainPage")
		"/grailsConsole"(view:"/grailsConsole")
		"500"(view:'/error')
		"404"(view:'/error')
	}
}
