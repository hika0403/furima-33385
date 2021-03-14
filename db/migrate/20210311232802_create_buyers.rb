class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :postal_code,  default:"", null: false
      t.integer :prefecture,              null: false
      t.string :town,         default:"", null: false
      t.string :address,      default:"", null: false
      t.string :building,     default:""
      t.string :phone_number, default:"", null: false
      t.references :order,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
