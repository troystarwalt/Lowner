class ItemSharesController < ApplicationController
  def new
    @item_id = params[:item]
    @new_share = ItemShare.new
    if params[:search_users]
      @users = User.search(params[:search_users])
      @item_search_id = Item.search(params[:item_id])
      @item_id = params[:item]
    else 
      @users = User.all
    end
  end

  def edit
  end

  def update
  end

  def destroy

    # item = current_user.shared_items.find()

    itemshare = ItemShare.where(id: params[:id]).first
    # byebug
    if itemshare.blank?
      flash[:alert] = "Not able to take back."
      redirect_to profile_path(current_user)
    else
      itemshare.delete
      flash[:notice] = "It's Yours Again!"
      redirect_to profile_path(current_user)
    end
  end

  def create
    @new_share = ItemShare.new(:user_id => params[:user_id], :item_id => params[:item_id])
    @user = current_user
    if @new_share.save
      redirect_to profile_path(current_user)
      flash[:notice] = "Item loanned."

    else
      render new_item_share_path
      flash[:notice] = "Sorry either that User or Item does not exist."
    end
  end


  private

  def itemShare_params
    params.require(:item_share).permit(:user_id, :item_id)
  end
end