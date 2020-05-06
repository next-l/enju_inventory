class CreateManifestations < ActiveRecord::Migration[5.2]
  def change
    create_table :manifestations, comment: '書誌' do |t|
      t.text :original_title, null: false, comment: 'タイトル'
      t.text :title_alternative
      t.text :title_transcription
      t.string :manifestation_identifier
      t.datetime :copyright_date
      t.datetime :date_of_publication, comment: '出版日'
      t.timestamps
      t.string :access_address, comment: 'アクセスアドレス'
      t.integer :language_id, default: 1, null: false
      t.integer :carrier_type_id, default: 1, null: false
      t.integer :start_page, comment: '開始ページ'
      t.integer :end_page, comment: '終了ページ'
      t.integer :height
      t.integer :width
      t.integer :depth
      t.integer :price # TODO: 通貨単位
      t.text :fulltext
      t.string :volume_number_string
      t.string :issue_number_string
      t.string :serial_number_string
      t.integer :edition
      t.text :note, comment: '備考'
      t.boolean :repository_content, default: false, null: false
      t.integer :lock_version, default: 0, null: false
      t.integer :required_role_id, default: 1, null: false
      t.integer :required_score, default: 0, null: false
      t.integer :frequency_id, default: 1, null: false
      t.boolean :subscription_master, default: false, null: false
    end
    #add_index :manifestations, :carrier_type_id
    #add_index :manifestations, :required_role_id
    add_index :manifestations, :access_address
    #add_index :manifestations, :frequency_id
    add_index :manifestations, :manifestation_identifier
    add_index :manifestations, :updated_at
    add_index :manifestations, :date_of_publication
  end
end
