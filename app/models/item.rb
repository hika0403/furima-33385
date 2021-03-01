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

  validates :price, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :charge
  belongs_to :area
  belongs_to :shopping_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :situation_id
    validates :charge_id
    validates :area_id
    validates :shopping_day_id
  end
end
