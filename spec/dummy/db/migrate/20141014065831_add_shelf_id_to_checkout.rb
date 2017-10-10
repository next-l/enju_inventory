class AddShelfIdToCheckout < ActiveRecord::Migration[5.1]
  def change
    add_column :checkouts, :shelf_id, :integer
    add_index :checkouts, :shelf_id
  end
end
