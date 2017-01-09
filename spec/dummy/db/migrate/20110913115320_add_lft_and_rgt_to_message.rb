class AddLftAndRgtToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :lft, :integer
    add_column :messages, :rgt, :integer
  end

  def self.down
    remove_column :messages, :rgt
    remove_column :messages, :lft
  end
end
