class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.decimal :price, precision: 10, scale: 2
      t.integer :category_id
    end
  end
end
