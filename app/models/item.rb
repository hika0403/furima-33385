class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :category_id
    validates :situation_id
    validates :charge_id
    validates :area_id
    validates :shopping_day_id
    validates :image
  end

  with_options numericality: { other_then: 1 } do
    validates :category_id
    validates :situation_id
    validates :charge_id
    validates :area_id
    validates :shopping_day_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :charge
  belongs_to :area
  belongs_to :shopping_day
end
