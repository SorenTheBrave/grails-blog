class UrlMappings {

	static mappings = {
        "/$controller/$action?/"{
            constraints {
                // apply constraints here
            }
        }
		
		"/view/$title?"(controller:"post",action:"show")

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
