class UsersController < ApplicationController
  def create
    username = params[:username]
    bio = params[:bio]
    new_user = User.create(username: username, bio: bio)
    render json: new_user
  end

  def destroy
    user_id = params[:id]
    User.destroy(user_id)
    render json: {"message":"Deleted #{user_id}"}
  end

  def index
    users = User.all
    render json: users
  end

  def show
    user_id = params[:id]
    user = User.find(user_id)
    render json: user
  end
end
