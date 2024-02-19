Rails.application.routes.draw do
  get("/", controller: "users", action: "index")                                                                                            
  get("/users", {:controller => "users", :action => "index" })
                                     
  get("/users/:username", {:controller => "users", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index" })

  get("/photos/:photo_id", {:controller => "photos", :action => "show"})

  get("/delete_photo/:photo_id", {:controller => 
"photos", :action => "delete"})

  post("/update_photo/:photo_id", {:controller => "photos", :action => "update"})

  post("/add_comment", {:controller => "photos", :action => "create"})
end
