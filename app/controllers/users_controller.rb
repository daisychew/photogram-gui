class UsersController < ApplicationController
  def index 
    @users = User.all

    render(template: "user_templates/index")
  end

  def show
    username = params.fetch("username")

    @user = User.where({:username => username}).at(0)

    @photos = Photo.where({:owner_id => @user.id})

    render(template: "user_templates/show")
  end
end
