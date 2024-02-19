Rails.application.routes.draw do
  get("/", controller: "users", action: "index")                                                                                             
     
  get("/users", {:controller => "users", :action => "index" })
                                     
  post("/users/:username", {:controller => "users", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index" })

  post("/photos/:photo_id", {:controller => "photos", :action => "show"})
end
