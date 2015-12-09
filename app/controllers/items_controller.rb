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
      @newUserItem = @user.items.new(item_params)
      if  @newUserItem.valid?
        @newUserItem.save 
        flash[:notice] = "Item created."
        redirect_to profile_path(@user)  

      else
       @errors = @newUserItem.errors.messages
       flash[:alert] = "Sorry, the item that you tried to upload was not valid." + @errors.to_s
       redirect_to profile_path(@user)  
     end
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
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Item was successfully destroyed.' }
      format.json { render nothing: true}
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
