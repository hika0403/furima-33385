## usersテーブル

| Column              | Type       | Option                    |
| ------------------- |----------- | ------------------------- | 
| nickname            | string     | null :false               |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| last-name-kanji     | string     | null: false               |
| last-name-katakana  | string     | null: false               |
| first-name-kanji    | string     | null: false               |
| first-name-katakana | string     | null: false               |
| birth-day           | date       | null: false               |
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
- belongs_to :buyer
- belongs_to :item

## buyersテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal-code  | string     | null: false       |
| prefecture   | string     | null: false       |
| town         | string     | null: false       |
| address      | string     | null: false       |
| building     | string     |                   |
| phone-number | string     | null: false       |
| buy          | references | foreign_key: true |

### Association
- has_one :buy

## itemsテーブル

| Column          | Type          | Options           |
| --------------- | ------------- | -----------       |
| item-name       | string        | null: false       |
| text            | text          | null: false       |
| category_id     | integer       | null: false       |
| situation_id    | integer       | null: false       |
| charge_id       | integer       | null: false       |
| area_id         | integer       | null: false       |
| shopping-day_id | integer       | null: false       |
| price           | integer       | null: false       |
| user            | references    | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy