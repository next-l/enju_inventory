class CreateBaskets < ActiveRecord::Migration[4.2]
  def change
    create_table :baskets do |t|
      t.references :user, index: true
      t.text :note
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
