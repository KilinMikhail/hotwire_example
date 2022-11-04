class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @subscribtion = Subscribtion.find_or_initialize_by(recepient: @user, subscriber: current_user)
  end
end
