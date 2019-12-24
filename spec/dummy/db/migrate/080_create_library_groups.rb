class CreateLibraryGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :library_groups do |t|
      t.string :name, null: false
      t.string :short_name, index: true, null: false
      t.text :my_networks
      t.text :login_banner
      t.text :note, comment: '備考'
      t.integer :country_id
      t.integer :position

      t.timestamps
    end
  end
end
