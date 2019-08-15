class CreateMessages < ActiveRecord::Migration[4.2]
  def self.up
    create_table :messages, force: true do |t|
      t.datetime :read_at
      t.references :sender, index: true
      t.references :receiver, index: true
      t.string   :subject, null: false
      t.text     :body
      t.references :message_request, index: true
      t.references :parent, index: true

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
