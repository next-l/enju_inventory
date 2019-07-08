class CreateFormOfWorks < ActiveRecord::Migration[4.2]
  def change
    create_table :form_of_works do |t|
      t.string :name, null: false
      t.text :display_name
      t.text :note
      t.integer :position

      t.timestamps
    end
  end
end
