class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :call_number
      t.string :item_identifier
      t.timestamps
      t.integer :shelf_id, default: 1, null: false
      t.boolean :include_supplements, default: false, null: false
      t.text :note
      t.string :url
      t.integer :price
      t.integer :lock_version, default: 0, null: false
      t.integer :required_role_id, default: 1, null: false
      t.integer :required_score, default: 0, null: false
    end
    add_index :items, :shelf_id
    add_index :items, :item_identifier
    add_index :items, :required_role_id
  end
end
