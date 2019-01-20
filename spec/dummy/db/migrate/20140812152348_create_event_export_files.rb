class CreateEventExportFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :event_export_files do |t|
      t.references :user, foreign_key: true
      t.attachment :event_export
      t.datetime :executed_at

      t.timestamps
    end
  end
end
