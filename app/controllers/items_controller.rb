class ItemsController < ApplicationController

  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
