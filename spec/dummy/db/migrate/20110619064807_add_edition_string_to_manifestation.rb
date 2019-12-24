class AddEditionStringToManifestation < ActiveRecord::Migration[5.2]
  def self.up
    add_column :manifestations, :edition_string, :string
  end

  def self.down
    remove_column :manifestations, :edition_string
  end
end
