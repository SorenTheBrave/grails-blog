class UrlMappings {

	static mappings = {
        "/$controller/$action?/"{
            constraints {
                // apply constraints here
            }
        }
		
		"/post/show/$title?"(controller:"post",action:"show")

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
