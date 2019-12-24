class CreateBookstores < ActiveRecord::Migration[5.2]
  def change
    create_table :bookstores do |t|
      t.text :name, null: false
      t.string :zip_code
      t.text :address
      t.text :note, comment: '備考'
      t.string :telephone_number
      t.string :fax_number
      t.string :url
      t.integer :position

      t.timestamps
    end
  end
end
