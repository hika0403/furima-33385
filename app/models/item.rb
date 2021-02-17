class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :price
  end
  with_options numericality: { other_then: 1 } do
    validates :category_id
    validates :situation_id
    validates :change_id
    validates :area_id
    validates :shopping_day_id
  end

  belongs_to :user

  
  belongs_to :category
  belongs_to :situation
  belongs_to :change
  belongs_to :area
  belongs_to :shopping_day
end
