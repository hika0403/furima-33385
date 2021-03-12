class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(buyer_params)
    if @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else 
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  def buyer_params
    params.require(:order_buyer).permit(:postal_code, :prefecture, :town, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
