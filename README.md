## usersテーブル

| Column   | Type   | Option      |
| -------- |------- | ----------- | 
| nickname | string | null :false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :items
- has_many :buys
- belongs_to :identity

## identitiesテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| last-name-kanji     | string     | null: false       |
| last-name-hiragana  | string     | null: false       |
| last-name-katakana  | string     | null: false       |
| first-name-kanji    | string     | null: false       |
| first-name-hiragana | string     | null: false       |
| first-name-katakana | string     | null: false       |
| last-name-hurigana  | string     | null: false       |
| first-name-hurigana | string     | null: false       |
| birth-day           | string     | null: false       |
| user_id             | references | foreign_key :true |

### Association
- has_one :user

## buysテーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| credit-card | string     | null: false       |
| user_id     | references | foreign_key: true |
| item_id     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buyer
- has_one :item

## buyersテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal-code  | string     | null: false       |
| prefecture   | string     | null: false       |
| town         | string     | null: false       |
| address      | string     | null: false       |
| phone-number | string     | null: false       |
| buy_id       | references | foreign_key: true |

### Association
- has_one :buy

## itemsテーブル

| Column          | Type          | Options           |
| --------------- | ------------- | -----------       |
| image           | ActiveStorage | null: false       |
| item-name       | string        | null: false       |
| text            | text          | null: false       |
| category        | ActiveHash    | null: false       |
| situation       | ActiveHash    | null: false       |
| shopping-charge | ActiveHash    | null: false       |
| area            | ActiveHash    | null: false       |
| shopping-day    | ActiveHash    | null: false       |
| price           | string        | null: false       |
| user_id         | references    | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buy