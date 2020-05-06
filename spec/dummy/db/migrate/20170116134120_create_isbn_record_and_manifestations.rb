class CreateIsbnRecordAndManifestations < ActiveRecord::Migration[5.2]
  def change
    create_table :isbn_record_and_manifestations, comment: '書誌とISBNの関係' do |t|
      t.references :isbn_record, foreign_key: true, on_delete: :cascade, null: false
      t.references :manifestation, foreign_key: true, null: false, on_delete: :cascade
      t.integer :position

      t.timestamps
    end
  end
end
