class CreateResourceExportFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_export_files do |t|
      t.references :user
      t.datetime :executed_at

      t.timestamps
    end
  end
end
