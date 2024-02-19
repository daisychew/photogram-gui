class PhotosController < ApplicationController
  def index 
    @photos = Photo.all

    render(template: "photo_templates/index")
  end

  def show
    photo_id = params.fetch("photo_id")

    @photo = Photo.where({:id => photo_id})

    render(template: "photo_templates/show")
  end
end
