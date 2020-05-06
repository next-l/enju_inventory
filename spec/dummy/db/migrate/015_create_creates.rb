class CreateCreates < ActiveRecord::Migration[5.2]
  def change
    create_table :creates, comment: '著者と書誌の関係' do |t|
      t.references :agent, null: false
      t.references :work, null: false
      t.integer :position
      t.timestamps
    end
  end
end
