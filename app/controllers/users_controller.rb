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
    if current_user
    else
      redirect_to root_path
    end
  end


  private

  def set_user
  	@user = User.find(params[:id])
  end

end