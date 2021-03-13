class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(buyer_params)
    if @order_buyer.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: buyer_params[:price],
        card: buyer_params[:token],
        currency: 'jpy'
      )
      @order_buyer.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.require(:order_buyer).permit(:postal_code, :prefecture, :town, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], price: Item.find(params[:item_id]).price, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end
end
