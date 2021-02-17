class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
      validates :last_name_kanji
      validates :first_name_kanji
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: '全角（カタカナ）を使用してください' } do
      validates :last_name_katakana
      validates :first_name_katakana
    end
  end
end
