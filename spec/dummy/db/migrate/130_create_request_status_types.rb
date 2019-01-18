class CreateRequestStatusTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :request_status_types do |t|
      t.string :name, null: false
      t.jsonb :display_name, default: {}, null: false
      t.text :note
      t.integer :position

      t.timestamps
    end
  end
end
