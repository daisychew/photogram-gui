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

  def delete
    photo_id = params.fetch("photo_id")

    @the_photo = Photo.find(photo_id)
    
    @the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."})
  end

  def update
    photo_id = params.fetch("photo_id")
    @the_photo = Photo.find(photo_id)

    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")

    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{@the_photo.id}", { :alert => "Photo failed to update successfully." })
    end
  end

  def create
    @the_comment = Comment.new
  
    @the_comment.photo_id = params.fetch("input_photo_id")
    @the_comment.author_id = params.fetch("input_author_id")
    @the_comment.body = params.fetch("input_comment")
  
    if @the_comment.valid?
      @the_comment.save
      redirect_to("/photos/#{@the_comment.photo_id}", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos/#{@the_comment.photo_id}", { :notice => "Photo failed to create successfully." })
    end
  end  
end
