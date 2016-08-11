class CreateRelevants < ActiveRecord::Migration
  def change
    create_table :relevants do |t|
      t.string :tipo
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
