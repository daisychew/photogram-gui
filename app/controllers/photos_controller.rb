class PhotosController < ApplicationController
  def index 
    @photos = Photo.all

    render(template: "photo_templates/index")
  end

  def show
    photo_id = params.fetch("photo_id")

    @photo = Photo.where({:id => photo_id}).at(0)

    @photo_owner = User.where(:id => @photo.owner_id).at(0)

    @comments = Comment.where({:photo_id => photo_id})

    render(template: "photo_templates/show")
  end
end
