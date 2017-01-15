class CreateCirculationStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :circulation_statuses do |t|
      t.string :name, null: false, index: {unique: true}
      t.jsonb :display_name_translations
      t.text :note
      t.integer :position

      t.timestamps
    end
  end
end
