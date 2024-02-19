Rails.application.routes.draw do
  get("/", controller: "users", action: "index")                                                                                            
  get("/users", {:controller => "users", :action => "index" })
                                     
  get("/users/:username", {:controller => "users", :action => "show"})

  post("/users", {:controller => "users", :action => "create" })

  post("/update_user/:user_id", {:controller => "users", :action => "update" })

  get("/photos", {:controller => "photos", :action => "index" })

  get("/photos/:photo_id", {:controller => "photos", :action => "show"})

  post("/insert_photo_record", {:controller => "photos", :action => "create"})

  get("/delete_photo/:photo_id", {:controller => 
"photos", :action => "delete"})

  post("/update_photo/:photo_id", {:controller => "photos", :action => "update"})

  post("/add_comment", {:controller => "comments", :action => "create"})
end
