class AddForeignKeyToShelvesReferencingLibraries < ActiveRecord::Migration[4.2]
  def change
    add_foreign_key :shelves, :libraries
    add_foreign_key :items, :shelves
  end
end
