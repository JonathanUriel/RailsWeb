class AddPromocion < ActiveRecord::Migration
  def change
    add_column :galleries, :promocion, :string
  end
end
