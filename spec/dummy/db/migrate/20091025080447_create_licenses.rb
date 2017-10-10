class CreateLicenses < ActiveRecord::Migration[5.1]
  def change
    create_table :licenses do |t|
      t.string :name, :null => false
      t.string :display_name
      t.text :note
      t.integer :position

      t.timestamps
    end
  end
end
