class ItemSharesController < ApplicationController
  def new
    @new_share = ItemShare.new
  end

  def edit
  end

  def update
  end

  def delete
  end

  def create


   if @new_share = ItemShare.new(itemShare_params)
    # if @user.exists?(:user_id=>@user.id) && @item.exist?(:item_id=>@user.id)
      @new_share.save(itemShare_params)
    else
      render new_item_share_path
      flash[:alert] = "Sorry either that User or Item does not exist."
    end
  end


  private

  def itemShare_params
    params.require(:item_share).permit(:user_id, :item_id)
  end
end