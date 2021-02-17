class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string  :name,            null: false
      t.text    :text,            null: false
      t.integer :category_id,     null: false
      t.integer :situation_id,    null: false
      t.integer :charge_id,       null: false
      t.integer :area_id,         null: false
      t.integer :shopping_day_id, null: false
      t.integer :price,           null: false
    end
  end
end
