class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state
      t.string :abreviation

      t.timestamps null: false
    end
  end
end
