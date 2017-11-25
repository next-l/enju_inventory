class CreateBaskets < ActiveRecord::Migration[5.1]
  def change
    create_table :baskets, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, foreign_key: true
      t.text :note
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
