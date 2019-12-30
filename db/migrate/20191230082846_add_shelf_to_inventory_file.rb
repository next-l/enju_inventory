class AddShelfToInventoryFile < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventory_files, :shelf, foreign_key: true, null: false
  end
end
