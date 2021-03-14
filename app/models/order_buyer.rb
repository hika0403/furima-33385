class OrderBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :town, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture, numericality: { other_than: 0 }
    validates :town
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{0,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, prefecture: prefecture, town: town, address: address, building: building,
                 phone_number: phone_number, order_id: order.id)
  end
end
