class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :phone
      t.string :street
      t.string :colony
      t.integer :number
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
