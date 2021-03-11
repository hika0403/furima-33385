class OrderBuyer
  include ActiveModel::Model 
  attr_accessor :postal_code, :prefecture, :town, :address, :building, :phone_number

  with_options presence: true do
    valivates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    valivates :prefecture, numericality: { other_than: 0 }
    valivates :town
    valivates :address
    valivates :phone_number, format: { with: /\A[0-9]{11}\z/ }
  end

  def save
    user = User.new
    item = Item.new
    Order.create(user_id: user.id, item_id: item.id)
    Buyer.create(postal_code: postal_code, prefecture: prefecture, town: town, address: address, building: building, phone_number: phone_number, user_id: user.id)
  end
end