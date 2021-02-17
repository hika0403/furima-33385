class ItemsController < ApplicationController

  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
  end
end
