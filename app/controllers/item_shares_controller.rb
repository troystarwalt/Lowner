class ItemSharesController < ApplicationController
  def new
    @new_share = ItemShare.create(user_id: :id, item_id: :id)
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