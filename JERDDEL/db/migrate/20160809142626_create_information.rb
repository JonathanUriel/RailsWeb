class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.text :mission
      t.text :vision
      t.text :objetive
      t.text :values
      t.text :history

      t.timestamps null: false
    end
  end
end
