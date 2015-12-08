class UsersController < ApplicationController


	before_action :authenticate_user!, :set_user, only: [:show]

  def index
    if params[:search]
      @users = User.search(params[:search])
    else 
     @users = User.all
   end
   
 end

 def show
  @have = current_user.shared_items
    if current_user == User.find(params[:id])
     flash
    elsif current_user != User.find(params[:id])
      redirect_to profile_path(current_user)
      flash[:notice] = "This is your correct profile #{current_user.username}!"
    else
      redirect_to root_path
      flash[:alert] = "You need to have an account or login before going to your profile page."
    end
  end

  def about
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

end