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

  def create
    @the_user = User.new
    @the_user.username = params.fetch("query_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :notice => "User failed to create successfully." })
    end
  end
end
