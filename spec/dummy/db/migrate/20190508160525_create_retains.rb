class CreateRetains < ActiveRecord::Migration[5.2]
  def change
    create_table :retains do |t|
      t.references :reserve, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false

      t.timestamps
    end
  end
end
