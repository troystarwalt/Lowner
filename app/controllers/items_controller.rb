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
      @user.items.create(item_params)
      flash[:notice] = "Item created."
      redirect_to profile_path(@user)
    else
      flash[:alert] = "You'll need to have an account or login to create an item."
      redirect_to new_user_session_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = current_user
    @item.destroy
    if @item == nil
      redirect_to profile_path(id: @user)
    else
      flash[:alert] = "Ooops, something went wrong."

    end
  end





  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category, :avatar)
  end

end
