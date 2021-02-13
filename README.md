## usersテーブル

| Column              | Type       | Option                    |
| ------------------- |----------- | ------------------------- | 
| nickname            | string     | null :false               |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| last_name_kanji     | string     | null: false               |
| last_name_katakana  | string     | null: false               |
| first_name_kanji    | string     | null: false               |
| first_name_katakana | string     | null: false               |
| birth_day           | date       | null: false               |
| user                | references | foreign_key :true         |

### Association
- has_many :items
- has_many :buys

## buysテーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer
- belongs_to :item

## buyersテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | string     | null: false       |
| area_id      | integer    | null: false       |
| town         | string     | null: false       |
| address      | string     | null: false       |
| building     | string     |                   |
| phone_number | string     | null: false       |
| buy          | references | foreign_key: true |

### Association
- belongs_to :buy

## itemsテーブル

| Column          | Type          | Options           |
| --------------- | ------------- | -----------       |
| name       | string        | null: false       |
| text            | text          | null: false       |
| category_id     | integer       | null: false       |
| situation_id    | integer       | null: false       |
| charge_id       | integer       | null: false       |
| area_id         | integer       | null: false       |
| shopping_day_id | integer       | null: false       |
| price           | integer       | null: false       |
| user            | references    | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy