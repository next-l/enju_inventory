class CreatePictureFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_files, id: :uuid do |t|
      t.references :picture_attachable, null: false, type: :uuid
      t.string :picture_attachable_type, null: false
      t.text :title
      t.integer :position

      t.timestamps
    end
    add_index :picture_files, [:picture_attachable_id, :picture_attachable_type], name: "index_picture_files_on_picture_attachable_id_and_type"
  end
end
