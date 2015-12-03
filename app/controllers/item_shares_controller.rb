class ItemSharesController < ApplicationController
  def new
    @user = current_user
    @item = current_user.items
    @new_share = ItemShare.new
  end

  def edit
  end

  def update
  end

  def delete
  end

  def create
  end
end