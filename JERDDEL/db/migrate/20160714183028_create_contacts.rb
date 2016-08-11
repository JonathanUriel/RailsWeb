class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.string :extension

      t.timestamps null: false
    end
  end
end
