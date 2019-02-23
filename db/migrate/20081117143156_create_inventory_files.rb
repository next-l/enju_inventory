class CreateInventoryFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :inventory_files, id: :uuid do |t|
      t.references :user, foreign_key: true, null: false
      t.text :note

      t.timestamps
    end
  end
end
