class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @item = Item.new
    @user = User.all
  end

  def create
    @user = current_user
    if user_signed_in?
      @item = Item.new(item_params)
      @item.save
      redirect_to profile_path(@user)
    else
      flash[:notice] = "You'll need to have an account or login to create an item."
      redirect_to new_user_session_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category, :avatar)
  end

end
