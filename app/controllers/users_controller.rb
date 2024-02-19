class UsersController < ApplicationController
  def index 
    @users = User.all

    render(template: "user_templates/index")
  end

  def show
    user_id = params.fetch("user_id")

    @user = User.where({:id => user_id})

    render(template: "user_templates/show")
  end
end
