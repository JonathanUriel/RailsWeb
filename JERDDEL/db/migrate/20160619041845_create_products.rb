class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :sale_price
      t.float :purchase_price
      t.text :description
      t.text :use
      t.float :cantidad
      t.string :extension
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
