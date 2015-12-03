class UsersController < ApplicationController


	before_action :authenticate_user!, :set_user, only: [:show]

  def index
  	@users = User.all
  end

  def show

    if current_user
      console
    else
      redirect_to root_path
    end
  end


  private

  def set_user
  	@user = User.find(params[:id])
  end

end
