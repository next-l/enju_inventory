class CreateIdentifierTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :identifier_types do |t|
      t.string :name
      t.text :display_name
      t.text :note, comment: '備考'
      t.integer :position

      t.timestamps
    end
  end
end
