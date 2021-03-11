class OrdersController < ApplicationController
  def index
    @order_buyer = OrderBuyer.new
  end

  def create
  end
end
