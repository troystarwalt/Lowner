class ItemSharesController < ApplicationController
  def new
    # byebug
    @item_id = params[:item]
    @new_share = ItemShare.new
    @users = User.all
  end

  def edit
  end

  def update
  end

  def delete
  end

  def create
    @new_share = ItemShare.new(itemShare_params)
    @user = current_user
    # @itemId = @user.items
      if @new_share.save(itemShare_params)
    # if @user.exists?(:user_id=>@user.id) && @item.exist?(:item_id=>@user.id)
        redirect_to profile_path(current_user)

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