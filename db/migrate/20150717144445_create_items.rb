class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :customer_id
      t.string  :name          , null: false
      t.integer :price_in_cents, null: false
      t.string  :category

      t.timestamps null: false
    end
  end
end
