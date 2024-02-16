Rails.application.routes.draw do
  get("/users", {:controller => "user", action: => "index" })

  post("/users/:username", {:controller => "user", :action => "show"})

  get("/photos", {:controller => "photo", action: => "index" })

  post("/photos/:photo_id", {:controller => "photo", :action => "show"})
end
